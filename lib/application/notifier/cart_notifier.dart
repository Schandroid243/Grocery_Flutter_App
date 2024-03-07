import 'dart:collection';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/state/cart_state.dart';

import '../../models/cart.dart';
import '../../models/cart_product.dart';

class CartNotifier extends StateNotifier<CartState> {
  final APIService _apiService;

  CartNotifier(this._apiService) : super(const CartState()) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    state = state.copyWith(isLoading: true);

    final cartData = await _apiService.getCart();

    state = state.copyWith(cartModel: cartData);
    state = state.copyWith(isLoading: false);
  }

  Future<void> addCartItem(productId, qty) async {
    await _apiService.addCartItem(productId, qty);

    await getCartItems();
  }

  Future<void> removeCartItem(productId, qty) async {
    await _apiService.removeCartItem(productId, qty);

    var isCartItemExist = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updatedItems = Cart.copy(obj: state.cartModel!);
    var data = jsonEncode(updatedItems.products);
    var decodeData = jsonDecode(data);
    //var productsList = Cart.fromJson(decodeData).products;
    var b = (decodeData as List<dynamic>)
        .map((productJson) =>
            CartProduct.fromJson(productJson as Map<String, dynamic>))
        .toList();

    Cart updateCart = Cart(
        cartId: state.cartModel!.cartId,
        userId: state.cartModel!.userId,
        products: b);
    updateCart.products.toList().remove(isCartItemExist);

    state = state.copyWith(cartModel: updateCart);
  }

  Future<void> updateQty(productId, qty, type) async {
    var cartItem = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updatedItems = state.cartModel!;

    if (type == "-") {
      await _apiService.removeCartItem(productId, 1);

      if (cartItem.qty > 1) {
        CartProduct cartProduct =
            CartProduct(qty: cartItem.qty - 1, product: cartItem.product);

        updatedItems.products.toList().remove(cartItem);
        updatedItems.products.toList().add(cartProduct);
      } else {
        updatedItems.products.toList().remove(cartItem);
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      CartProduct cartProduct =
          CartProduct(qty: cartItem.qty + 1, product: cartItem.product);

      updatedItems.products.toList().remove(cartItem);
      updatedItems.products.toList().add(cartProduct);
    }

    state = state.copyWith(cartModel: updatedItems);
  }
}

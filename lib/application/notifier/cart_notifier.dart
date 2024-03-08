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
    try {
      final response = await _apiService.removeCartItem(productId, qty);

      if (response!) {
        var isCartItemExist = state.cartModel!.products.firstWhere(
          (element) => element.product.productId == productId,
          orElse: () {
            throw StateError("No matching element found");
          },
        );

        var updatedItems = state.cartModel!.copyWith(
          products: List.from(state.cartModel!.products)
            ..remove(isCartItemExist),
        );
        state = state.copyWith(cartModel: updatedItems);
      } else {
        print('Error removing item');
      }
    } catch (e) {
      print('Error removing item: $e');
    }
  }

  Future<void> updateQty(productId, qty, type) async {
    var cartItem = state.cartModel!.products
        .firstWhere((element) => element.product.productId == productId);

    var updatedItems = state.cartModel!.copyWith(
      products: List.from(state.cartModel!.products),
    );

    var encodeData = jsonEncode(updatedItems);
    var dataDecoded = jsonDecode(encodeData);

    var updatedCart = Cart.fromJson(dataDecoded);
    List<CartProduct> b = <CartProduct>[];
    if (type == "-") {
      await _apiService.removeCartItem(productId, 1);

      if (cartItem.qty > 1) {
        CartProduct cartProduct =
            CartProduct(qty: cartItem.qty - 1, product: cartItem.product);

        b = updatedCart.products.toList();
        b.remove(cartItem);
        b.add(cartProduct);
        updatedItems = state.cartModel!.copyWith(
          products: b,
        );
      } else {
        b.remove(cartItem);
        updatedItems = state.cartModel!.copyWith(
          products: b,
        );
      }
    } else {
      await _apiService.addCartItem(productId, 1);

      CartProduct cartProduct =
          CartProduct(qty: cartItem.qty + 1, product: cartItem.product);

      b = updatedCart.products.toList();
      b.remove(cartItem);
      b.add(cartProduct);
      updatedItems = state.cartModel!.copyWith(
        products: b,
      );
    }

    state = state.copyWith(cartModel: updatedItems);
  }
}

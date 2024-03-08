import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/models/cart.dart';
import 'package:grocery_app/providers.dart';
import 'package:grocery_app/widgets/widget_cart_item.dart';

import '../config.dart';
import '../models/cart_product.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      bottomNavigationBar: _checkOutBottomNavBar(),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: _cartList(ref),
          )
        ],
      )),
    );
  }

  Widget _buildCartItems(List<CartProduct> cartProducts, WidgetRef ref) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return CartItemWidget(
            model: cartProducts[index],
            onQtyUpdate: (CartProduct model, qty, type) {
              final cartViewModel = ref.read(cartItemsProvider.notifier);
              cartViewModel.updateQty(model.product.productId, qty, type);
            },
            onItemRemove: (CartProduct model) {
              final cartViewModel = ref.read(cartItemsProvider.notifier);
              final productId = model.product.productId;
              if (cartProducts
                  .any((item) => item.product.productId == productId)) {
                cartViewModel.removeCartItem(productId, model.qty);
              } else {
                print('Item with productId $productId not found in the cart.');
              }
            },
          );
        });
  }

  Widget _cartList(WidgetRef ref) {
    final cartState = ref.watch(cartItemsProvider);

    if (cartState.cartModel == null) {
      return const LinearProgressIndicator();
    }

    if (cartState.cartModel!.products.isEmpty) {
      return const Center(child: Text('Cart is empty'));
    }

    return _buildCartItems(cartState.cartModel!.products, ref);
  }
}

class _checkOutBottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProvider = ref.watch(cartItemsProvider);

    if (cartProvider.cartModel != null) {
      return cartProvider.cartModel!.products.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Total: ${cartProvider.cartModel!.grandTotal.toString()} ${Config.currency}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const Text("Proceed to Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15))
                    ],
                  ),
                ),
              )),
            )
          : const SizedBox();
    }

    return const SizedBox();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'cart_product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
abstract class Cart with _$Cart {
  factory Cart({
    required String userId,
    required List<CartProduct> products,
    required String cartId,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  factory Cart.copy({required Cart obj}) {
    var myArgs =
        obj.products.map((item) => CartProduct.copy(obj: item)).toList();

    return Cart(
      userId: obj.userId,
      cartId: obj.cartId,
      products: myArgs,
    );
  }

  static Cart gotIt(Map<String, dynamic> json) {
    return Cart(
      userId: json['userId'] as String,
      cartId: json['cartId'] as String,
      products: (json['products'] as List<dynamic>)
          .map((productJson) => CartProduct.fromJson(productJson))
          .toList(),
    );
  }
}

extension CartExt on Cart {
  double get grandTotal {
    return products
        .map((e) => e.product.productPrice * e.qty)
        .fold(0, (p, c) => p + c);
  }
}

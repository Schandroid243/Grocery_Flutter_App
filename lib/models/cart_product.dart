import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';
import 'product.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
abstract class CartProduct with _$CartProduct {
  factory CartProduct({
    required double qty,
    required Product product,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  factory CartProduct.copy({required CartProduct obj}) {
    return CartProduct(
      qty: obj.qty,
      product: obj.product,
    );
  }
}

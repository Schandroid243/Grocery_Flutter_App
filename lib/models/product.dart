import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grocery_app/config.dart';

import 'category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

List<Product> productsFromJson(dynamic str) =>
    List<Product>.from((str).map((x) => Product.fromJson(x)));

@freezed
abstract class Product with _$Product {
  factory Product(
      {required String productName,
      required Category category,
      required String? productShortDescription,
      required double productPrice,
      required double productSalePrice,
      required String productImage,
      required String? productSKU,
      required String? productType,
      required String? stockStatus,
      required String productId,
      List<String>? relatedProducts}) = _Product;
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

extension ProductExt on Product {
  String get fullImagePath => Config.imageUrl + productImage;
  int get calculateDiscount {
    double disPercent = 0;
    if (!productPrice.isNaN) {
      double regularPrice = productPrice;
      double salePrice = productSalePrice > 0 ? productSalePrice : regularPrice;
      double discount = regularPrice - salePrice;
      disPercent = (discount / regularPrice) * 100;
    }
    return disPercent.round();
  }
}

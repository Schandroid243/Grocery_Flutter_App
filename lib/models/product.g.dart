// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productName: json['productName'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      productShortDescription: json['productShortDescription'] as String,
      productPrice: (json['productPrice'] as num).toDouble(),
      productSalePrice: (json['productSalePrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      productSKU: json['productSKU'] as String,
      productType: json['productType'] as String,
      stockStatus: json['stockStatus'] as String,
      productId: json['productId'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'category': instance.category,
      'productShortDescription': instance.productShortDescription,
      'productPrice': instance.productPrice,
      'productSalePrice': instance.productSalePrice,
      'productImage': instance.productImage,
      'productSKU': instance.productSKU,
      'productType': instance.productType,
      'stockStatus': instance.stockStatus,
      'productId': instance.productId,
    };

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get productName => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get productShortDescription => throw _privateConstructorUsedError;
  double get productPrice => throw _privateConstructorUsedError;
  double get productSalePrice => throw _privateConstructorUsedError;
  String get productImage => throw _privateConstructorUsedError;
  String get productSKU => throw _privateConstructorUsedError;
  String get productType => throw _privateConstructorUsedError;
  String get stockStatus => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  List<String>? get relatedProducts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String productName,
      Category category,
      String productShortDescription,
      double productPrice,
      double productSalePrice,
      String productImage,
      String productSKU,
      String productType,
      String stockStatus,
      String productId,
      List<String>? relatedProducts});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? category = null,
    Object? productShortDescription = null,
    Object? productPrice = null,
    Object? productSalePrice = null,
    Object? productImage = null,
    Object? productSKU = null,
    Object? productType = null,
    Object? stockStatus = null,
    Object? productId = null,
    Object? relatedProducts = freezed,
  }) {
    return _then(_value.copyWith(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      productShortDescription: null == productShortDescription
          ? _value.productShortDescription
          : productShortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productSalePrice: null == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productSKU: null == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedProducts: freezed == relatedProducts
          ? _value.relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productName,
      Category category,
      String productShortDescription,
      double productPrice,
      double productSalePrice,
      String productImage,
      String productSKU,
      String productType,
      String stockStatus,
      String productId,
      List<String>? relatedProducts});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productName = null,
    Object? category = null,
    Object? productShortDescription = null,
    Object? productPrice = null,
    Object? productSalePrice = null,
    Object? productImage = null,
    Object? productSKU = null,
    Object? productType = null,
    Object? stockStatus = null,
    Object? productId = null,
    Object? relatedProducts = freezed,
  }) {
    return _then(_$ProductImpl(
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      productShortDescription: null == productShortDescription
          ? _value.productShortDescription
          : productShortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double,
      productSalePrice: null == productSalePrice
          ? _value.productSalePrice
          : productSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      productSKU: null == productSKU
          ? _value.productSKU
          : productSKU // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedProducts: freezed == relatedProducts
          ? _value._relatedProducts
          : relatedProducts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {required this.productName,
      required this.category,
      required this.productShortDescription,
      required this.productPrice,
      required this.productSalePrice,
      required this.productImage,
      required this.productSKU,
      required this.productType,
      required this.stockStatus,
      required this.productId,
      final List<String>? relatedProducts})
      : _relatedProducts = relatedProducts;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String productName;
  @override
  final Category category;
  @override
  final String productShortDescription;
  @override
  final double productPrice;
  @override
  final double productSalePrice;
  @override
  final String productImage;
  @override
  final String productSKU;
  @override
  final String productType;
  @override
  final String stockStatus;
  @override
  final String productId;
  final List<String>? _relatedProducts;
  @override
  List<String>? get relatedProducts {
    final value = _relatedProducts;
    if (value == null) return null;
    if (_relatedProducts is EqualUnmodifiableListView) return _relatedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(productName: $productName, category: $category, productShortDescription: $productShortDescription, productPrice: $productPrice, productSalePrice: $productSalePrice, productImage: $productImage, productSKU: $productSKU, productType: $productType, stockStatus: $stockStatus, productId: $productId, relatedProducts: $relatedProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(
                    other.productShortDescription, productShortDescription) ||
                other.productShortDescription == productShortDescription) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.productSalePrice, productSalePrice) ||
                other.productSalePrice == productSalePrice) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.productSKU, productSKU) ||
                other.productSKU == productSKU) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            const DeepCollectionEquality()
                .equals(other._relatedProducts, _relatedProducts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productName,
      category,
      productShortDescription,
      productPrice,
      productSalePrice,
      productImage,
      productSKU,
      productType,
      stockStatus,
      productId,
      const DeepCollectionEquality().hash(_relatedProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {required final String productName,
      required final Category category,
      required final String productShortDescription,
      required final double productPrice,
      required final double productSalePrice,
      required final String productImage,
      required final String productSKU,
      required final String productType,
      required final String stockStatus,
      required final String productId,
      final List<String>? relatedProducts}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get productName;
  @override
  Category get category;
  @override
  String get productShortDescription;
  @override
  double get productPrice;
  @override
  double get productSalePrice;
  @override
  String get productImage;
  @override
  String get productSKU;
  @override
  String get productType;
  @override
  String get stockStatus;
  @override
  String get productId;
  @override
  List<String>? get relatedProducts;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

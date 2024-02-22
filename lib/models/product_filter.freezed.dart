// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductFilterModel {
  PaginationModel get paginationModel => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  List<String>? get productIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFilterModelCopyWith<ProductFilterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterModelCopyWith<$Res> {
  factory $ProductFilterModelCopyWith(
          ProductFilterModel value, $Res Function(ProductFilterModel) then) =
      _$ProductFilterModelCopyWithImpl<$Res, ProductFilterModel>;
  @useResult
  $Res call(
      {PaginationModel paginationModel,
      String? categoryId,
      String? sortBy,
      List<String>? productIds});

  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class _$ProductFilterModelCopyWithImpl<$Res, $Val extends ProductFilterModel>
    implements $ProductFilterModelCopyWith<$Res> {
  _$ProductFilterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
    Object? productIds = freezed,
  }) {
    return _then(_value.copyWith(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      productIds: freezed == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationModelCopyWith<$Res> get paginationModel {
    return $PaginationModelCopyWith<$Res>(_value.paginationModel, (value) {
      return _then(_value.copyWith(paginationModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductFilterModelImplCopyWith<$Res>
    implements $ProductFilterModelCopyWith<$Res> {
  factory _$$ProductFilterModelImplCopyWith(_$ProductFilterModelImpl value,
          $Res Function(_$ProductFilterModelImpl) then) =
      __$$ProductFilterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginationModel paginationModel,
      String? categoryId,
      String? sortBy,
      List<String>? productIds});

  @override
  $PaginationModelCopyWith<$Res> get paginationModel;
}

/// @nodoc
class __$$ProductFilterModelImplCopyWithImpl<$Res>
    extends _$ProductFilterModelCopyWithImpl<$Res, _$ProductFilterModelImpl>
    implements _$$ProductFilterModelImplCopyWith<$Res> {
  __$$ProductFilterModelImplCopyWithImpl(_$ProductFilterModelImpl _value,
      $Res Function(_$ProductFilterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginationModel = null,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
    Object? productIds = freezed,
  }) {
    return _then(_$ProductFilterModelImpl(
      paginationModel: null == paginationModel
          ? _value.paginationModel
          : paginationModel // ignore: cast_nullable_to_non_nullable
              as PaginationModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      productIds: freezed == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$ProductFilterModelImpl implements _ProductFilterModel {
  _$ProductFilterModelImpl(
      {required this.paginationModel,
      this.categoryId,
      this.sortBy,
      final List<String>? productIds})
      : _productIds = productIds;

  @override
  final PaginationModel paginationModel;
  @override
  final String? categoryId;
  @override
  final String? sortBy;
  final List<String>? _productIds;
  @override
  List<String>? get productIds {
    final value = _productIds;
    if (value == null) return null;
    if (_productIds is EqualUnmodifiableListView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductFilterModel(paginationModel: $paginationModel, categoryId: $categoryId, sortBy: $sortBy, productIds: $productIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterModelImpl &&
            (identical(other.paginationModel, paginationModel) ||
                other.paginationModel == paginationModel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginationModel, categoryId,
      sortBy, const DeepCollectionEquality().hash(_productIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterModelImplCopyWith<_$ProductFilterModelImpl> get copyWith =>
      __$$ProductFilterModelImplCopyWithImpl<_$ProductFilterModelImpl>(
          this, _$identity);
}

abstract class _ProductFilterModel implements ProductFilterModel {
  factory _ProductFilterModel(
      {required final PaginationModel paginationModel,
      final String? categoryId,
      final String? sortBy,
      final List<String>? productIds}) = _$ProductFilterModelImpl;

  @override
  PaginationModel get paginationModel;
  @override
  String? get categoryId;
  @override
  String? get sortBy;
  @override
  List<String>? get productIds;
  @override
  @JsonKey(ignore: true)
  _$$ProductFilterModelImplCopyWith<_$ProductFilterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

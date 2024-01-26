import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/application/notifier/product_filter_notifier.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/product_filter.dart';

import '../models/category.dart';
import '../models/product.dart';
import 'application/notifier/product_notifier.dart';
import 'application/state/product_state.dart';

final categoriesProvider =
    FutureProvider.family<List<Category>?, PaginationModel>(
        (ref, paginationModel) async {
  final apiRepository = ref.watch(apiService);

  return apiRepository.getCategpries(
      paginationModel.page, paginationModel.pageSize);
});

final homeProductProvider =
    FutureProvider.family<List<Product>?, ProductFilterModel>(
        (ref, productFilterModel) async {
  final apiRepository = ref.watch(apiService);

  return apiRepository.getProducts(productFilterModel);
});

final productFilterProvider =
    StateNotifierProvider<ProductsFilterNotifier, ProductFilterModel>(
        (ref) => ProductsFilterNotifier());

final productNotifierProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) =>
        ProductsNotifier(
            ref.watch(apiService), ref.watch(productFilterProvider)));

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/api/api_service.dart';
import 'package:grocery_app/models/pagination.dart';
import 'package:grocery_app/models/product_filter.dart';

import '../models/category.dart';
import '../models/product.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/providers.dart';

import '../components/product_card.dart';
import '../models/pagination.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../models/product_filter.dart';

class HomeProductWidget extends ConsumerWidget {
  const HomeProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> list = List<Product>.empty(growable: true);
    list.add(Product(
      productName: "Test Product",
      category: Category(
          categoryName: "Samsung",
          categoryImage:
              "/uploads/categories/1704444668026-profile_picture.jpeg",
          categoryId: "6597c2fc755a924a54a8f8c0"),
      productShortDescription: "test short description",
      productPrice: 500,
      productSalePrice: 250,
      productImage: "/uploads/products/1705462319464-git.png",
      productSKU: "123",
      productType: "simple",
      productId: "65a74a2f104048294a136317",
      stockStatus: "IN",
    ));
    return Container(
        color: const Color(0xffF4F7FA),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16, top: 15),
                  child: Text("Top 10 Products",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: _productList(ref),
            )
          ],
        ));
  }

  Widget _productList(WidgetRef ref) {
    final products = ref.watch(homeProductProvider(ProductFilterModel(
        paginationModel: PaginationModel(page: 1, pageSize: 10))));

    return products.when(data: (list) {
      if (list != null && list.isNotEmpty) {
        return _buildProductList(list);
      } else {
        // Handle the case where the list is null or empty
        return const Center(child: Text("No categories available."));
      }
    }, error: (error, stackTrace) {
      print('Error: $error');
      print('Stack Trace: $stackTrace');
      return Center(child: Text("Something went wrong! Error: $error"));
    }, loading: () {
      return const Center(child: CircularProgressIndicator());
    });
  }

  Widget _buildProductList(List<Product> products) {
    return Container(
        height: 200,
        alignment: Alignment.centerLeft,
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              var data = products[index];
              return GestureDetector(
                  onTap: () {}, child: ProductCard(model: data));
            }));
  }
}

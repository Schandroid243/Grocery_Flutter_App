import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/models/product_sort.dart';

import '../components/product_card.dart';
import '../models/pagination.dart';
import '../models/product_filter.dart';
import '../providers.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String? categoryId;
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Container(
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ProductFilter(
                categoryId: categoryId,
                categoryName: categoryName,
              ),
              Flexible(flex: 1, child: _ProductList())
            ],
          )),
    );
  }

  @override
  void didChangeDependencies() {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      categoryName = arguments["categoryName"];
      categoryId = arguments["categoryId"];
    }
    super.didChangeDependencies();
  }
}

class _ProductFilter extends ConsumerWidget {
  final _sortByOptions = [
    ProductSortModel(value: "-productPrice", label: "Price: High to Low"),
    ProductSortModel(value: "productPrice", label: "Price: Low to High"),
  ];

  _ProductFilter({Key? key, this.categoryName, this.categoryId});

  final String? categoryName;
  final String? categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterProvider = ref.watch(productFilterProvider);

    return Container(
        height: 51,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(categoryName!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: PopupMenuButton(
                onSelected: (sortBy) {
                  ProductFilterModel filterModel = ProductFilterModel(
                      paginationModel: PaginationModel(page: 0, pageSize: 10),
                      categoryId: filterProvider.categoryId,
                      sortBy: sortBy.toString());

                  ref
                      .read(productFilterProvider.notifier)
                      .setProductFilter(filterModel);

                  ref.read(productNotifierProvider.notifier).getProducts();
                },
                initialValue: filterProvider.sortBy,
                itemBuilder: (BuildContext context) {
                  return _sortByOptions.map((item) {
                    return PopupMenuItem(
                        value: item.value,
                        child: InkWell(child: Text(item.label!)));
                  }).toList();
                },
                icon: const Icon(Icons.filter_list_alt),
              ))
        ]));
  }
}

class _ProductList extends ConsumerWidget {
  final ScrollController _scrollConroller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    _scrollConroller.addListener(() {
      if (_scrollConroller.position.pixels ==
          _scrollConroller.position.maxScrollExtent) {
        final productsViewModel = ref.read(productNotifierProvider.notifier);
        final productsState = ref.watch(productNotifierProvider);

        if (productsState.hasNext) {
          productsViewModel.getProducts();
        }
      }
    });

    if (productState.products.isEmpty) {
      if (!productState.hasNext && !productState.isLoading) {
        return const Center(child: Text("No products"));
      }
      return const LinearProgressIndicator();
    }
    return RefreshIndicator(
      onRefresh: () async {
        ref.read(productNotifierProvider.notifier).refreshProducts();
      },
      child: Column(
        children: [
          Flexible(
              flex: 1,
              child: GridView.count(
                  controller: _scrollConroller,
                  crossAxisCount: 2,
                  children:
                      List.generate(productState.products.length, (index) {
                    return ProductCard(model: productState.products[index]);
                  }))),
          Visibility(
              visible:
                  productState.isLoading && productState.products.isNotEmpty,
              child: const SizedBox(
                  height: 35, width: 35, child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}

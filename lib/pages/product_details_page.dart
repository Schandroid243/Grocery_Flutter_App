import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/components/widget_collapse_expand.dart';
import 'package:grocery_app/components/widget_custom_stepper.dart';
import 'package:grocery_app/providers.dart';

import '../config.dart';
import '../models/product.dart';
import '../widgets/widget_related_product.dart';

class ProductDetailsPage extends ConsumerStatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends ConsumerState<ProductDetailsPage> {
  String productId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product Details")),
        body: SingleChildScrollView(
          child: _productDetails(ref),
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      productId = arguments["productId"];
    }
  }

  Widget _productDetails(WidgetRef ref) {
    final details = ref.watch(productDetailsProvider(productId));

    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productDetailsUI(model!),
              RelatedProductWidget(model.relatedProducts!),
              const SizedBox(height: 10)
            ],
          );
        },
        error: (_, __) => const Center(child: Text("Error")),
        loading: () => const Center(child: CircularProgressIndicator()));
  }

  Widget _productDetailsUI(Product model) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.network(model.fullImagePath, fit: BoxFit.fitHeight),
            ),
            Text(model.productName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("${model.productPrice.toString()} ${Config.currency}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            color: model.calculateDiscount > 0
                                ? Colors.red
                                : Colors.black,
                            decoration: model.productSalePrice > 0
                                ? TextDecoration.lineThrough
                                : null)),
                    Text(
                        (model.calculateDiscount > 0)
                            ? "  ${model.productSalePrice.toString()} ${Config.currency}"
                            : "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        )),
                  ],
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Text("SHARE",
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                    label:
                        const Icon(Icons.share, color: Colors.black, size: 20))
              ],
            ),
            Text("Availability: ${model.stockStatus}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Product code: ${model.productSKU}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomStepper(
                    lowerLimit: 1,
                    upperLimit: 20,
                    stepValue: 1,
                    iconSize: 22.0,
                    value: 1,
                    onChanged: (value) {}),
                TextButton.icon(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    icon:
                        const Icon(Icons.shopping_basket, color: Colors.white),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            const SizedBox(height: 15),
            CollapseExpand(
                title: "SHORT DESCRIPTION",
                content: model.productShortDescription),
          ],
        ));
  }
}

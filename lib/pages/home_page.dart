import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/widget_home_categories.dart';

import '../widgets/widget_home_products.dart';
import '../widgets/widget_home_sliders.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grocery App"),
      ),
      body: ListView(children: const [
        HomeSliderWidget(),
        HomeCategoriesWidget(),
        HomeProductWidget()
      ] //ProductCard(model: model)],
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/pages/register_page.dart';
import 'package:grocery_app/utils/shared_service.dart';

import 'pages/dashboard_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/product_details_page.dart';
import 'pages/products_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _results = await SharedService.isLoggedIn();

  if (_results) {
    _defaultHome = const DashboardPage();
  }
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      //home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        '/': (context) => _defaultHome,
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/home': (BuildContext context) => const HomePage(),
        '/product-details': (BuildContext context) =>
            const ProductDetailsPage(),
      },
    );
  }
}

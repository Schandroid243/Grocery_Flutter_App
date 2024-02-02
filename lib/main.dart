import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/pages/register_page.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/products_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const RegisterPage(),
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => const RegisterPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/products': (BuildContext context) => const ProductsPage(),
        '/home': (BuildContext context) => const HomePage(),
      },
    );
  }
}

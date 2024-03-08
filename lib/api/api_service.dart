import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:grocery_app/models/login_response_model.dart';
import 'package:grocery_app/utils/shared_service.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../models/cart.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/product_filter.dart';
import '../models/slider.dart';

final apiService = Provider((ref) => APIService());

class APIService {
  static var client = http.Client();

  Future<List<Category>?> getCategpries(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.categoryAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("The response from the api is: ${response.body}");
      return categoriesFromJson(data["data"]);
    } else {
      print("The response from the api is: ${response.body}");
      return null;
    }
  }

  Future<List<Product>?> getProducts(
      ProductFilterModel productFilterModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': productFilterModel.paginationModel.page.toString(),
      'pageSize': productFilterModel.paginationModel.pageSize.toString(),
    };

    if (productFilterModel.categoryId != null) {
      queryString["categoryId"] = productFilterModel.categoryId!;
      print("Query string 1 is: $queryString");
    }

    if (productFilterModel.sortBy != null) {
      queryString["sort"] = productFilterModel.sortBy!;
      print("Query string 2 is: $queryString");
    }

    if (productFilterModel.productIds != null) {
      queryString["productIds"] = productFilterModel.productIds!.join(",");
      print("Query string 3 is: $queryString");
    }

    var baseUrl = "${Config.apiUrl}/${Config.productAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print("The response from the api is: ${response.body}");
      return productsFromJson(data["data"]);
    } else {
      print("The response from the api is: ${response.body}");
      return null;
    }
  }

  static Future<bool> registerUser(
      String fullName, String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.registerAPI}";
    var uri = Uri.parse(baseUrl);
    var response = await client.post(uri,
        headers: requestHeaders,
        body: jsonEncode(
            {"fullName": fullName, "email": email, "password": password}));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> loginUser(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.loginAPI}";
    var uri = Uri.parse(baseUrl);
    var response = await client.post(uri,
        headers: requestHeaders,
        body: jsonEncode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      await SharedService.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  Future<List<SliderModel>?> getSliders(page, pageSize) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> queryString = {
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    };

    var baseUrl = "${Config.apiUrl}/${Config.sliderAPI}";
    var uri = Uri.parse(baseUrl).replace(queryParameters: queryString);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return SlidersFromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<Product?> getProductDetails(String productId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var baseUrl = "${Config.apiUrl}/${Config.productAPI}/$productId";
    var uri = Uri.parse(baseUrl);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Product.fromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<Cart?> getCart() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token.toString()}'
    };

    var baseUrl = "${Config.apiUrl}/${Config.cartAPI}";
    var uri = Uri.parse(baseUrl);

    var response = await client.get(uri, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return Cart.fromJson(data["data"]);
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }

  Future<bool?> addCartItem(productId, qty) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token.toString()}'
    };

    var baseUrl = "${Config.apiUrl}/${Config.cartAPI}";
    var uri = Uri.parse(baseUrl);

    var response = await client.post(uri,
        headers: requestHeaders,
        body: jsonEncode({
          "products": [
            {"product": productId, "qty": qty}
          ]
        }));

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }

  Future<bool?> removeCartItem(productId, qty) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token.toString()}'
    };

    var baseUrl = "${Config.apiUrl}/${Config.cartAPI}";
    var uri = Uri.parse(baseUrl);

    print("The item productId is: $productId and the qty is: $qty");

    var response = await client.delete(uri,
        headers: requestHeaders,
        body: jsonEncode({"productId": productId, "qty": qty})); // Fix here
    print("The cart response is: $response");
    if (response.statusCode == 200) {
      print("The cart response is: $response");
      return true;
    } else if (response.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil("/login", (route) => false);
    } else {
      return null;
    }
    return null;
  }
}

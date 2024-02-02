import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/config.dart';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/product.dart';
import '../models/product_filter.dart';

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
    }

    if (productFilterModel.sortBy != null) {
      queryString["sort"] = productFilterModel.sortBy!;
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
      return true;
    } else {
      return false;
    }
  }
}

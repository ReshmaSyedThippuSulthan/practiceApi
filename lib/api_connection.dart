import 'dart:convert';

import 'package:http/http.dart' as http;

import 'cards/cards.dart';
import 'products_data/products_data.dart';

class ApiConnection {
  Future<ProductsData?> apiCall() async {
    String url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url)); // json
    print(response.body);
    if (response.statusCode == 200) {
      final data = ProductsData.fromJson(response.body);
      return data;
    } else {
      print("some is error");
    }
    return null;
  }

  Future<Cards?> cartsCall() async {
    String url1 = "https://dummyjson.com/carts";
    final response = await http.get(Uri.parse(url1));
    print(response.body);
    if (response.statusCode == 200) {
      final datas = Cards.fromJson(response.body);
      return datas;
    } else {
      print("some is error");
    }
    return null;
  }
}

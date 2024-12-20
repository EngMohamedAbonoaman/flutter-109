import 'dart:convert';

import 'package:http/http.dart' as http;

class getAllCategoriesService {
  Future<List<String>> getAllCategories() async {
    List<String> categories = [];
    try {
      http.Response response = await http
          .get(Uri.parse("https://fakestoreapi.com/products/categories"));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          categories.add(data[i]);
        }
      } else {
        throw Exception("Something went wrong!");
      }
    } catch (e) {}
    return categories;
  }
}

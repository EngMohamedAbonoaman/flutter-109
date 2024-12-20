import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class getCategoryService {
  Future<List<Product>> getProductsByCategory({required String CatName}) async {
    List<Product> products = [];
    try {
      var response = await http.get(
          Uri.parse("https://fakestoreapi.com/products/category/$CatName"));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        data.forEach((element) {
          products.add(Product.fromJson(element));
        });
      } else {
        throw Exception("Status code != 200");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
    return products;
  }
}

// class getProductCategoryService {
//   Future<List<Product>> getProductCategory({required String category}) async {
//     List<Product> products = [];
//     try {
//       http.Response response = await http.get(
//           Uri.parse("https://fakestoreapi.com/products/category/$category"));
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//
//         for (int i = 0; i < data.length; i++) {
//           products.add(Product.fromJson(data[i]));
//         }
//       } else {
//         throw Exception("Something went wrong!");
//       }
//     } catch (e) {}
//     return products;
//   }
// }

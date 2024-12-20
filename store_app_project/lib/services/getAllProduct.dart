import 'dart:convert';

import 'package:store_app_project/models/product.dart';
import 'package:http/http.dart' as http;

class GetAllProductsService {
  Future<List<Product>?> getAllProducts() async {
    List<Product> products = [];
    try {
      http.Response respone =
          await http.get(Uri.parse("https://fakestoreapi.com/products"));
      List<dynamic> data = jsonDecode(respone.body);
      if (respone.statusCode == 200) {
        for (int i = 0; i < data.length; i++) {
          products.add(Product.fromJson(data[i]));
        }
      } else {
        throw Exception("Status code != 200");
      }
    } catch (e) {
      print("Something went wrong!: ${e.toString()}");
    }
    return products;
  }
}

// class AllProductsService {
//   Future<List<Product>> getAllProducts() async {
//     List<Product> products = [];
//     try {
//       http.Response response =
//           await http.get(Uri.parse("https://fakestoreapi.com/products"));
//       if (response.statusCode == 200) {
//         List<dynamic> data = jsonDecode(response.body);
//
//         for (int i = 0; i < data.length; i++) {
//           products.add(Product.fromJson(data[i]));
//         }
//       } else {
//         throw Exception("Something went wrong!");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return products;
//   }
// }

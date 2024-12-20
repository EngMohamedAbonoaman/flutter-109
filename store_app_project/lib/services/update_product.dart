// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../models/product.dart';
//
// class UpdateProductService {
//   Future<Product> updateProduct(
//       {required String id, required Map<String, dynamic> productData}) async {
//     Product product = Product(
//         id: 0,
//         title: "",
//         price: 0.0,
//         description: "",
//         image: "",
//         productRate: ProductRate(rate: 0.0, count: 0.0),
//         category: '');
//     try {
//       http.Response response = await http.put(
//           Uri.parse("https://fakestoreapi.com/products/$id"),
//           body: productData);
//
//       if (response.statusCode == 200) {
//         product = Product.fromJson(jsonDecode(response.body));
//       } else {
//         product = Product(
//             id: 0,
//             title: "",
//             price: 0.0,
//             description: "",
//             image: "",
//             productRate: ProductRate(rate: 0.0, count: 0.0));
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//     return product;
//   }
// }

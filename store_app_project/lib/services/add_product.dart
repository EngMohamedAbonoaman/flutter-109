import 'package:http/http.dart' as http;
import 'package:store_app_project/models/product.dart';

class AddProductService {
  Future<int> addProduct(Product product) async {
    int productId = 0;
    try {
      http.Response response =
          await http.post(Uri.parse("https://fakestoreapi.com/products"),
              headers: {
                'Accept': 'application/json',
                //'Content-Type': 'application/from-data'
              },
              body: product.toJson(product));

      if (response.statusCode == 200) {
        print("***************\n ${response.body}");
        productId = int.parse(response.body);
      } else {
        throw Exception("Something went wrong!");
      }
    } catch (e) {
      print(e.toString());
    }
    return productId;
  }
}

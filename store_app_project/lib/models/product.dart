// class Product {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String image;
//   final ProductRate productRate;
//
//   Product(
//       {required this.id,
//       required this.title,
//       required this.price,
//       required this.description,
//       required this.image,
//       required this.productRate});
//   factory Product.fromJson(jsonData) {
//     return Product(
//         id: jsonData['id'],
//         title: jsonData['title'],
//         price: double.parse(jsonData['price']),
//         description: jsonData['description'],
//         image: jsonData['image'],
//         productRate: ProductRate.fromJson(jsonData['ratings '] ?? {}));
//   }
// }
//
// class ProductRate {
//   final double rate;
//   final double count;
//
//   ProductRate({
//     required this.rate,
//     required this.count,
//   });
//   factory ProductRate.fromJson(jsonData) {
//     return ProductRate(
//       rate: jsonData['rate'] ?? 3.4,
//       count: jsonData['count'] ?? 4,
//     );
//   }
// }

class Product {
  final String id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final Map<String, dynamic> rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> jsonData) {
    return Product(
      id: jsonData['id'].toString(),
      title: jsonData['title'],
      price: jsonData['price'].toString(),
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: jsonData['rating'] ?? {},
    );
  }
  toJson(Product product) {
    return {
      'id': product.id,
      'title': product.title,
      'price': product.price,
      'description': product.description,
      'image': product.image,
      'rating': ""
    };
  }
}

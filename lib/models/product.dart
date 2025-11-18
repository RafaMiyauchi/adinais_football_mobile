import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String id;
  int? userId;
  String name;
  int price;
  String description;
  String thumbnail;
  String category;
  int stock;
  String brand;
  int rating;

  Product({
    required this.id,
    required this.userId,
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.stock,
    required this.brand,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        thumbnail: json["thumbnail"] ?? "", // Handle potential nulls
        category: json["category"],
        stock: json["stock"],
        brand: json["brand"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "price": price,
        "description": description,
        "thumbnail": thumbnail,
        "category": category,
        "stock": stock,
        "brand": brand,
        "rating": rating,
      };
}
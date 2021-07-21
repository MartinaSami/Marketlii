import 'dart:convert';

ProductByCategory productByCategoryFromJson(String str) =>
    ProductByCategory.fromJson(json.decode(str));

String productByCategoryToJson(ProductByCategory data) =>
    json.encode(data.toJson());

class ProductByCategory {
  ProductByCategory({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory ProductByCategory.fromJson(Map<String, dynamic> json) =>
      ProductByCategory(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.description,
    this.imagePath,
    this.price,
    this.availableNumber,
    this.rating,
    this.ratingsNumber,
    this.categoryId,
    this.favorite,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String description;
  String imagePath;
  String price;
  String availableNumber;
  String rating;
  String ratingsNumber;
  String categoryId;
  String favorite;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imagePath: json["image_path"],
        price: json["price"],
        availableNumber: json["available_number"],
        rating: json["rating"],
        ratingsNumber: json["ratings_number"],
        categoryId: json["category_id"],
        favorite: json["favorite"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_path": imagePath,
        "price": price,
        "available_number": availableNumber,
        "rating": rating,
        "ratings_number": ratingsNumber,
        "category_id": categoryId,
        "favorite": favorite,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

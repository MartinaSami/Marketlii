import 'dart:convert';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  Search({
    this.message,
    this.data,
  });

  String message;
  List<SearchProduct> data;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        message: json["Message"],
        data: List<SearchProduct>.from(
            json["data"].map((x) => SearchProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SearchProduct {
  SearchProduct({
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

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
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

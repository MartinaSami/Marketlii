import 'dart:convert';

Favorite favoriteFromJson(String str) => Favorite.fromJson(json.decode(str));

String favoriteToJson(Favorite data) => json.encode(data.toJson());

class Favorite {
  Favorite({
    this.message,
    this.data,
  });

  String message;
  List<FavoriteDatum> data;

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        message: json["message"],
        data: List<FavoriteDatum>.from(
            json["data"].map((x) => FavoriteDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FavoriteDatum {
  FavoriteDatum({
    this.id,
    this.name,
    this.description,
    this.imagePath,
    this.price,
    this.availableNumber,
    this.rating,
    this.ratingsNumber,
    this.categoryId,
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
  DateTime createdAt;
  DateTime updatedAt;

  factory FavoriteDatum.fromJson(Map<String, dynamic> json) => FavoriteDatum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imagePath: json["image_path"],
        price: json["price"],
        availableNumber: json["available_number"],
        rating: json["rating"],
        ratingsNumber: json["ratings_number"],
        categoryId: json["category_id"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

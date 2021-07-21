import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.message,
    this.data,
  });

  String message;
  List<CategoryDatum> data;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        message: json["message"],
        data: List<CategoryDatum>.from(
            json["data"].map((x) => CategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDatum {
  CategoryDatum({
    this.id,
    this.name,
    this.parentId,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String parentId;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

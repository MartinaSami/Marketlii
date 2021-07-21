import 'dart:convert';

SupCategory supCategoryFromJson(String str) =>
    SupCategory.fromJson(json.decode(str));

String supCategoryToJson(SupCategory data) => json.encode(data.toJson());

class SupCategory {
  SupCategory({
    this.message,
    this.data,
  });

  String message;
  List<CategoryDatum2> data;

  factory SupCategory.fromJson(Map<String, dynamic> json) => SupCategory(
        message: json["message"],
        data: List<CategoryDatum2>.from(
            json["data"].map((x) => CategoryDatum2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoryDatum2 {
  CategoryDatum2({
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

  factory CategoryDatum2.fromJson(Map<String, dynamic> json) => CategoryDatum2(
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

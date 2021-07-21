import 'dart:convert';

SliderModel sliderFromJson(String str) =>
    SliderModel.fromJson(json.decode(str));

String sliderToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.message,
    this.data,
  });

  String message;
  List<SliderDatum> data;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        message: json["message"],
        data: List<SliderDatum>.from(
            json["data"].map((x) => SliderDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class SliderDatum {
  SliderDatum({
    this.id,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String imagePath;
  DateTime createdAt;
  DateTime updatedAt;

  factory SliderDatum.fromJson(Map<String, dynamic> json) => SliderDatum(
        id: json["id"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

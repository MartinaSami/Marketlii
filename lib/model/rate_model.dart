import 'dart:convert';

Rate rateFromJson(String str) => Rate.fromJson(json.decode(str));

String rateToJson(Rate data) => json.encode(data.toJson());

class Rate {
  Rate({
    this.message,
    this.data,
  });

  String message;
  List<Datum> data;

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
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
    this.name,
    this.rate,
    this.content,
    this.createdAt,
  });

  String name;
  String rate;
  String content;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        rate: json["rate"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rate": rate,
        "content": content,
        "created_at": createdAt.toIso8601String(),
      };
}

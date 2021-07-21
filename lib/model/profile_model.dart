// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.name,
    this.email,
    this.mobile,
    this.address,
  });

  String name;
  String email;
  String mobile;
  String address;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "address": address,
      };
}

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    this.message,
    this.data,
    this.total,
  });

  String message;
  List<CartDatum> data;
  int total;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"],
        data: List<CartDatum>.from(
            json["data"].map((x) => CartDatum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class CartDatum {
  CartDatum({
    this.productId,
    this.name,
    this.price,
    this.quantity,
    this.total,
    this.image,
  });

  int productId;
  String name;
  String price;
  String quantity;
  String total;
  String image;

  factory CartDatum.fromJson(Map<String, dynamic> json) => CartDatum(
        productId: json["product_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "price": price,
        "quantity": quantity,
        "total": total,
        "image": image,
      };
}

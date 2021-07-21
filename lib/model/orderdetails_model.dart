import 'dart:convert';

OrdersDetails ordersDetailsFromJson(String str) =>
    OrdersDetails.fromJson(json.decode(str));

String ordersDetailsToJson(OrdersDetails data) => json.encode(data.toJson());

class OrdersDetails {
  OrdersDetails({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory OrdersDetails.fromJson(Map<String, dynamic> json) => OrdersDetails(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.orderCode,
    this.userId,
    this.state,
    this.address,
    this.total,
    this.date,
    this.products,
  });

  int orderCode;
  int userId;
  String state;
  String address;
  String total;
  DateTime date;
  List<OrderProduct> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderCode: json["order_code"],
        userId: json["user_id"],
        state: json["state"],
        address: json["address"],
        total: json["total"],
        date: DateTime.parse(json["date"]),
        products: List<OrderProduct>.from(
            json["products"].map((x) => OrderProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_code": orderCode,
        "user_id": userId,
        "state": state,
        "address": address,
        "total": total,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class OrderProduct {
  OrderProduct({
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

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
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

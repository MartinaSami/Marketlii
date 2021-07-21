import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    this.message,
    this.data,
  });

  String message;
  List<OrderDatum> data;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        message: json["message"],
        data: List<OrderDatum>.from(
            json["data"].map((x) => OrderDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderDatum {
  OrderDatum({
    this.orderCode,
    this.total,
    this.date,
  });

  int orderCode;
  String total;
  DateTime date;

  factory OrderDatum.fromJson(Map<String, dynamic> json) => OrderDatum(
        orderCode: json["order_code"],
        total: json["total"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "order_code": orderCode,
        "total": total,
        "date": date.toIso8601String(),
      };
}

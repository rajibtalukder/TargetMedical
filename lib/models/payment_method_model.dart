
import 'dart:convert';

class PaymentMethodModel {
  final List<PaymentMethod>? paymentMethod;

  PaymentMethodModel({
    this.paymentMethod,
  });

  factory PaymentMethodModel.fromJson(String str) => PaymentMethodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromMap(Map<String, dynamic> json) => PaymentMethodModel(
    paymentMethod: json["payment_method"] == null ? [] : List<PaymentMethod>.from(json["payment_method"]!.map((x) => PaymentMethod.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "payment_method": paymentMethod == null ? [] : List<dynamic>.from(paymentMethod!.map((x) => x.toMap())),
  };
}

class PaymentMethod {
  final int? id;
  final String? method;
  final String? number;

  PaymentMethod({
    this.id,
    this.method,
    this.number,
  });

  factory PaymentMethod.fromJson(String str) => PaymentMethod.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethod.fromMap(Map<String, dynamic> json) => PaymentMethod(
    id: json["id"],
    method: json["method"],
    number: json["number"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "method": method,
    "number": number,
  };
}

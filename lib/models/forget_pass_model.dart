// To parse this JSON data, do
//
//     final forgetPassModel = forgetPassModelFromJson(jsonString);

import 'dart:convert';

ForgetPassModel forgetPassModelFromJson(String str) =>
    ForgetPassModel.fromJson(json.decode(str));

String forgetPassModelToJson(ForgetPassModel data) =>
    json.encode(data.toJson());

class ForgetPassModel {
  String? status;
  String? message;
  Data? data;

  ForgetPassModel({
    this.status,
    this.message,
    this.data,
  });

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) =>
      ForgetPassModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int otp;
  int userId;

  Data({
    required this.otp,
    required this.userId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    otp: json["otp"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "user_id": userId,
  };
}

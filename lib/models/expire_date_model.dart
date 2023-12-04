import 'dart:convert';

class ExpireDateModel {
  int? status;
  String? message;
  Data? data;

  ExpireDateModel({
     this.status,
     this.message,
     this.data,
  });

  factory ExpireDateModel.fromRawJson(String str) => ExpireDateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpireDateModel.fromJson(Map<String, dynamic> json) => ExpireDateModel(
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
  String userId;
  DateTime expireDate;

  Data({
    required this.userId,
    required this.expireDate,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    expireDate: DateTime.parse(json["expire_date"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "expire_date": expireDate.toIso8601String(),
  };
}

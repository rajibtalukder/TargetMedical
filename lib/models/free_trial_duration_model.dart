import 'dart:convert';

class FreeTrialDurationModel {
  String status;
  String message;
  Data data;

  FreeTrialDurationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FreeTrialDurationModel.fromRawJson(String str) => FreeTrialDurationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FreeTrialDurationModel.fromJson(Map<String, dynamic> json) => FreeTrialDurationModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  int duration;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.duration,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    duration: json["duration"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "duration": duration,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

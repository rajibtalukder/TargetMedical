import 'dart:convert';

class CheckResultModel {
  String status;
  String message;
  Data data;

  CheckResultModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CheckResultModel.fromRawJson(String str) => CheckResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckResultModel.fromJson(Map<String, dynamic> json) => CheckResultModel(
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
  List<ExamResult> examResult;

  Data({
    required this.examResult,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    examResult: List<ExamResult>.from(json["exam_result"].map((x) => ExamResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "exam_result": List<dynamic>.from(examResult.map((x) => x.toJson())),
  };
}

class ExamResult {
  int userId;
  String name;
  int examTotalMark;
  int userMark;

  ExamResult({
    required this.userId,
    required this.name,
    required this.examTotalMark,
    required this.userMark,
  });

  factory ExamResult.fromRawJson(String str) => ExamResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExamResult.fromJson(Map<String, dynamic> json) => ExamResult(
    userId: json["user_id"],
    name: json["name"],
    examTotalMark: json["exam_total_mark"],
    userMark: json["user_mark"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "exam_total_mark": examTotalMark,
    "user_mark": userMark,
  };
}

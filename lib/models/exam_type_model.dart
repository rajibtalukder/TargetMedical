import 'dart:convert';

class ExamTypeModel {
  final int? examTypeId;
  final String? examTypeName;

  ExamTypeModel({
    this.examTypeId,
    this.examTypeName,
  });

  factory ExamTypeModel.fromJson(String str) =>
      ExamTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeModel.fromMap(Map<String, dynamic> json) => ExamTypeModel(
        examTypeId: json["exam_type_id"],
        examTypeName: json["exam_type_name"],
      );

  Map<String, dynamic> toMap() => {
        "exam_type_id": examTypeId,
        "exam_type_name": examTypeName,
      };
}

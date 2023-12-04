import 'dart:convert';

class ExamModel {
  final int? examId;
  final String? examName;
  final int? examTypeId;
  final int? time;
  final int? bjs;
  final int? barC;

  ExamModel({
    this.examId,
    this.examName,
    this.examTypeId,
    this.time,
    this.bjs,
    this.barC,
  });

  ExamModel copyWith({
    int? examId,
    String? examName,
    int? examTypeId,
    int? time,
    int? bjs,
    int? barC,
  }) =>
      ExamModel(
        examId: examId ?? this.examId,
        examName: examName ?? this.examName,
        examTypeId: examTypeId ?? this.examTypeId,
        time: time ?? this.time,
        bjs: bjs ?? this.bjs,
        barC: barC ?? this.barC,
      );

  factory ExamModel.fromJson(String str) => ExamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamModel.fromMap(Map<String, dynamic> json) => ExamModel(
        examId: json["exam_id"],
        examName: json["exam_name"],
        examTypeId: json["exam_type_id"],
        time: json["time"],
        bjs: json["bjs"],
        barC: json["bar_c"],
      );

  Map<String, dynamic> toMap() => {
        "exam_id": examId,
        "exam_name": examName,
        "exam_type_id": examTypeId,
        "time": time,
        "bjs": bjs,
        "bar_c": barC,
      };
}



import 'dart:convert';

class LiveExamModel {
  final List<LiveExam>? liveExams;

  LiveExamModel({
    this.liveExams,
  });

  factory LiveExamModel.fromJson(String str) => LiveExamModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LiveExamModel.fromMap(Map<String, dynamic> json) => LiveExamModel(
    liveExams: json["live_exam"] == null ? [] : List<LiveExam>.from(json["live_exam"]!.map((x) => LiveExam.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "live_exam": liveExams == null ? [] : List<dynamic>.from(liveExams!.map((x) => x.toMap())),
  };
}

class LiveExam {
  final int? examId;
  final String? examName;
  final DateTime? examDate;
  final int? examineeNum;
  final String? examDuration;
  final int? totalQuestion;
  final String? examTime;
  final DateTime? schedule;
  final int? seen;

  LiveExam({
    this.examId,
    this.examName,
    this.examDate,
    this.examineeNum,
    this.examDuration,
    this.totalQuestion,
    this.examTime,
    this.schedule,
    this.seen,
  });

  factory LiveExam.fromJson(String str) => LiveExam.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LiveExam.fromMap(Map<String, dynamic> json) => LiveExam(
    examId: json["exam_id"],
    examName: json["exam_name"],
    examDate: json["exam_date"] == null ? null : DateTime.parse(json["exam_date"]),
    examineeNum: json["examinee_num"],
    examDuration: json["exam_duration"],
    totalQuestion: json["total_question"],
    examTime: json["exam_time"],
    schedule: json["schedule"] == null ? null : DateTime.parse(json["schedule"]),
    seen: json["seen"],
  );

  Map<String, dynamic> toMap() => {
    "exam_id": examId,
    "exam_name": examName,
    "exam_date": "${examDate!.year.toString().padLeft(4, '0')}-${examDate!.month.toString().padLeft(2, '0')}-${examDate!.day.toString().padLeft(2, '0')}",
    "examinee_num": examineeNum,
    "exam_duration": examDuration,
    "total_question": totalQuestion,
    "exam_time": examTime,
    "schedule": schedule?.toIso8601String(),
    "seen": seen,
  };
}

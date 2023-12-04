

import 'dart:convert';

class ExamHistoryModel {
  final int? userExam;
  final int? userLiveExam;
  final List<ExamHistory>? liveExam;
  final List<ExamHistory>? exam;

  ExamHistoryModel({
    this.userExam,
    this.userLiveExam,
    this.liveExam,
    this.exam,
  });

  ExamHistoryModel copyWith({
    int? userExam,
    int? userLiveExam,
    List<ExamHistory>? liveExam,
    List<ExamHistory>? exam,
  }) =>
      ExamHistoryModel(
        userExam: userExam ?? this.userExam,
        userLiveExam: userLiveExam ?? this.userLiveExam,
        liveExam: liveExam ?? this.liveExam,
        exam: exam ?? this.exam,
      );

  factory ExamHistoryModel.fromJson(String str) => ExamHistoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamHistoryModel.fromMap(Map<String, dynamic> json) => ExamHistoryModel(
    userExam: json["user_exam"],
    userLiveExam: json["user_live_exam"],
    liveExam: json["live_exam"] == null ? [] : List<ExamHistory>.from(json["live_exam"]!.map((x) => ExamHistory.fromMap(x))),
    exam: json["exam"] == null ? [] : List<ExamHistory>.from(json["exam"]!.map((x) => ExamHistory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "user_exam": userExam,
    "user_live_exam": userLiveExam,
    "live_exam": liveExam == null ? [] : List<dynamic>.from(liveExam!.map((x) => x.toMap())),
    "exam": exam == null ? [] : List<dynamic>.from(exam!.map((x) => x.toMap())),
  };
}

class ExamHistory {
  final int? examHistoryId;
  final int? examId;
  final int? examTotalMark;
  final int? userMark;
  final int? userId;
  final String? name;
  final String? examName;
  final int? numOfQues;

  ExamHistory({
    this.examHistoryId,
    this.examId,
    this.examTotalMark,
    this.userMark,
    this.userId,
    this.name,
    this.examName,
    this.numOfQues,
  });

  ExamHistory copyWith({
    int? examHistoryId,
    int? examId,
    int? examTotalMark,
    int? userMark,
    int? userId,
    String? name,
    String? examName,
    int? numOfQues,
  }) =>
      ExamHistory(
        examHistoryId: examHistoryId ?? this.examHistoryId,
        examId: examId ?? this.examId,
        examTotalMark: examTotalMark ?? this.examTotalMark,
        userMark: userMark ?? this.userMark,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        examName: examName ?? this.examName,
        numOfQues: numOfQues ?? this.numOfQues,
      );

  factory ExamHistory.fromJson(String str) => ExamHistory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamHistory.fromMap(Map<String, dynamic> json) => ExamHistory(
    examHistoryId: json["exam_history_id"],
    examId: json["exam_id"],
    examTotalMark: json["exam_total_mark"],
    userMark: json["user_mark"],
    userId: json["user_id"],
    name: json["name"],
    examName: json["exam_name"],
    numOfQues: json["num_of_ques"],
  );

  Map<String, dynamic> toMap() => {
    "exam_history_id": examHistoryId,
    "exam_id": examId,
    "exam_total_mark": examTotalMark,
    "user_mark": userMark,
    "user_id": userId,
    "name": name,
    "exam_name": examName,
    "num_of_ques": numOfQues,
  };
}

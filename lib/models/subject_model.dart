import 'dart:convert';

import 'chapter_model.dart';

class SubjectModel {
  final int? subId;
  final String? subCode;
  final String? subBnName;
  final String? subEnName;
  final int? bjs;
  final int? barC;
  final List<ChapterModel>? chapters;

  SubjectModel({
    this.subId,
    this.subCode,
    this.subBnName,
    this.subEnName,
    this.bjs,
    this.barC,
    this.chapters,
  });

  factory SubjectModel.fromJson(String str) =>
      SubjectModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectModel.fromMap(Map<String, dynamic> json) => SubjectModel(
        subId: json["sub_id"],
        subCode: json["sub_code"],
        subBnName: json["sub_bn_name"],
        subEnName: json["sub_en_name"],
        bjs: json["bjs"],
        barC: json["bar_c"],
        chapters: [],
      );

  Map<String, dynamic> toMap() => {
        "sub_id": subId,
        "sub_code": subCode,
        "sub_bn_name": subBnName,
        "sub_en_name": subEnName,
        "bjs": bjs,
        "bar_c": barC,
      };
}



import 'dart:convert';

class ChapterModel {
  final int? chapterId;
  final int? subId;
  final String? chapterBnName;
  final String? chapterEnName;
  final int? bjs;
  final int? barC;

  ChapterModel({
    this.chapterId,
    this.subId,
    this.chapterBnName,
    this.chapterEnName,
    this.bjs,
    this.barC,
  });

  factory ChapterModel.fromJson(String str) => ChapterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChapterModel.fromMap(Map<String, dynamic> json) => ChapterModel(
    chapterId: json["chapter_id"],
    subId: json["sub_id"],
    chapterBnName: json["chapter_bn_name"],
    chapterEnName: json["chapter_en_name"],
    bjs: json["bjs"],
    barC: json["bar_c"],
  );

  Map<String, dynamic> toMap() => {
    "chapter_id": chapterId,
    "sub_id": subId,
    "chapter_bn_name": chapterBnName,
    "chapter_en_name": chapterEnName,
    "bjs": bjs,
    "bar_c": barC,
  };
}



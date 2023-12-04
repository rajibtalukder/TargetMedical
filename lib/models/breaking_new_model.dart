import 'dart:convert';

class BreakingNewsModel {
  List<BreakingNew> breakingNews;

  BreakingNewsModel({
    required this.breakingNews,
  });

  factory BreakingNewsModel.fromRawJson(String str) => BreakingNewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreakingNewsModel.fromJson(Map<String, dynamic> json) => BreakingNewsModel(
    breakingNews: List<BreakingNew>.from(json["breaking_news"].map((x) => BreakingNew.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "breaking_news": List<dynamic>.from(breakingNews.map((x) => x.toJson())),
  };
}

class BreakingNew {
  int id;
  String breakingNews;
  DateTime createdAt;
  DateTime updatedAt;

  BreakingNew({
    required this.id,
    required this.breakingNews,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BreakingNew.fromRawJson(String str) => BreakingNew.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BreakingNew.fromJson(Map<String, dynamic> json) => BreakingNew(
    id: json["id"],
    breakingNews: json["breaking_news"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "breaking_news": breakingNews,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

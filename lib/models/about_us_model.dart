import 'dart:convert';

class AboutUsModel {
  List<AboutUs> aboutUs;

  AboutUsModel({
    required this.aboutUs,
  });

  factory AboutUsModel.fromRawJson(String str) => AboutUsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
    aboutUs: List<AboutUs>.from(json["about_us"].map((x) => AboutUs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "about_us": List<dynamic>.from(aboutUs.map((x) => x.toJson())),
  };
}

class AboutUs {
  int id;
  String title;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  AboutUs({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AboutUs.fromRawJson(String str) => AboutUs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

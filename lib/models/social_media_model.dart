import 'dart:convert';

class SocialMediaModel {
  final List<SocialMedia>? socialMedia;

  SocialMediaModel({
    this.socialMedia,
  });

  SocialMediaModel copyWith({
    List<SocialMedia>? socialMedia,
  }) =>
      SocialMediaModel(
        socialMedia: socialMedia ?? this.socialMedia,
      );

  factory SocialMediaModel.fromJson(String str) =>
      SocialMediaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SocialMediaModel.fromMap(Map<String, dynamic> json) =>
      SocialMediaModel(
        socialMedia: json["social_media"] == null
            ? []
            : List<SocialMedia>.from(json["social_media"]
            .map((x) => SocialMedia.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "social_media": socialMedia == null
        ? []
        : List<dynamic>.from(
      socialMedia!.map((x) => x.toMap()),
    ),
  };
}

class SocialMedia {
  final int? id;
  final String? title;
  final String? linkOrNumber;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  SocialMedia({
    this.id,
    this.title,
    this.linkOrNumber,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  SocialMedia copyWith({
    int? id,
    String? title,
    String? linkOrNumber,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      SocialMedia(
        id: id ?? this.id,
        title: title ?? this.title,
        linkOrNumber: linkOrNumber ?? this.linkOrNumber,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory SocialMedia.fromJson(String str) =>
      SocialMedia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromMap(Map<String, dynamic> json) => SocialMedia(
    id: json["id"],
    title: json["title"],
    linkOrNumber: json["link_or_number"],
    image: json["image"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "link_or_number": linkOrNumber,
    "image": image,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

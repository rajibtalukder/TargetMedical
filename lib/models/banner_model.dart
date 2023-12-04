import 'dart:convert';


class BannerModel {
  final int? bannerId;
  final String? image;

  BannerModel({
    this.bannerId,
    this.image,
  });

  factory BannerModel.fromJson(String str) => BannerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerModel.fromMap(Map<String, dynamic> json) => BannerModel(
        bannerId: json["banner_id"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "banner_id": bannerId,
        "image": image,
      };
}

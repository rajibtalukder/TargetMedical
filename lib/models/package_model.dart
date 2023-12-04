import 'dart:convert';

class PackageModel {
  final List<Package>? packageList;

  PackageModel({
    this.packageList,
  });

  factory PackageModel.fromJson(String str) => PackageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PackageModel.fromMap(Map<String, dynamic> json) => PackageModel(
    packageList: json["package_list"] == null ? [] : List<Package>.from(json["package_list"].map((x) => Package.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "package_list": packageList == null ? [] : List<dynamic>.from(packageList!.map((x) => x.toMap())),
  };
}

class Package {
  final int? packageId;
  final String? packageName;
  final String? packageDetail;
  final String? packageDetailApi;
  final String? packageDetailWeb;
  final String? amount;
  final String? time;
  final int? numOfDay;

  Package({
    this.packageId,
    this.packageName,
    this.packageDetail,
    this.packageDetailApi,
    this.packageDetailWeb,
    this.amount,
    this.time,
    this.numOfDay,
  });

  factory Package.fromJson(String str) => Package.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Package.fromMap(Map<String, dynamic> json) => Package(
    packageId: json["package_id"],
    packageName: json["package_name"],
    packageDetail: json["package_detail"],
    packageDetailApi: json["package_detail_api"],
    packageDetailWeb: json["package_detail_web"],
    amount: json["amount"],
    time: json["time"],
    numOfDay: json["num_of_day"],
  );

  Map<String, dynamic> toMap() => {
    "package_id": packageId,
    "package_name": packageName,
    "package_detail": packageDetail,
    "package_detail_api": packageDetailApi,
    "package_detail_web": packageDetailWeb,
    "amount": amount,
    "time": time,
    "num_of_day": numOfDay,
  };
}

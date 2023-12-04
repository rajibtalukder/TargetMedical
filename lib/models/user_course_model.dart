// To parse this JSON data, do
//
//     final userCourseModel = userCourseModelFromMap(jsonString);

import 'dart:convert';

class UserCourseModel {
  final int? coursePaymentListId;
  final int? userId;
  final int? courseId;
  final String? courseName;
  final String? courseBanner;
  final int? coursePrice;
  final int? discount;
  final int? discountPrice;
  final String? description;
  final String? desApi;
  final String? desWeb;
  final String? objective;
  final String? objectiveApi;
  final String? objectiveWeb;

  UserCourseModel({
    this.coursePaymentListId,
    this.userId,
    this.courseId,
    this.courseName,
    this.courseBanner,
    this.coursePrice,
    this.discount,
    this.discountPrice,
    this.description,
    this.desApi,
    this.desWeb,
    this.objective,
    this.objectiveApi,
    this.objectiveWeb,
  });

  factory UserCourseModel.fromJson(String str) => UserCourseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCourseModel.fromMap(Map<String, dynamic> json) => UserCourseModel(
    coursePaymentListId: json["course_payment_list_id"],
    userId: json["user_id"],
    courseId: json["course_id"],
    courseName: json["course_name"],
    courseBanner: json["course_banner"],
    coursePrice: json["course_price"],
    discount: json["discount"],
    discountPrice: json["discount_price"],
    description: json["description"],
    desApi: json["des_api"],
    desWeb: json["des_web"],
    objective: json["objective"],
    objectiveApi: json["objective_api"],
    objectiveWeb: json["objective_web"],
  );

  Map<String, dynamic> toMap() => {
    "course_payment_list_id": coursePaymentListId,
    "user_id": userId,
    "course_id": courseId,
    "course_name": courseName,
    "course_banner": courseBanner,
    "course_price": coursePrice,
    "discount": discount,
    "discount_price": discountPrice,
    "description": description,
    "des_api": desApi,
    "des_web": desWeb,
    "objective": objective,
    "objective_api": objectiveApi,
    "objective_web": objectiveWeb,
  };
}



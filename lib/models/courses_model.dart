

import 'dart:convert';

import 'package:target_medical/models/course_details_model.dart';

class CoursesModel {
  final List<Course>? courses;

  CoursesModel({
    this.courses,
  });

  CoursesModel copyWith({
    List<Course>? courses,
  }) =>
      CoursesModel(
        courses: courses ?? this.courses,
      );

  factory CoursesModel.fromJson(String str) => CoursesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CoursesModel.fromMap(Map<String, dynamic> json) => CoursesModel(
    courses: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "course": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x.toMap())),
  };
}

class Course {
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
  CourseDetailsModel? courseDetails = CourseDetailsModel();


  Course({
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
    this.courseDetails,
  });

  Course copyWith({
    int? courseId,
    String? courseName,
    String? courseBanner,
    int? coursePrice,
    int? discount,
    int? discountPrice,
    String? description,
    String? desApi,
    String? desWeb,
    String? objective,
    String? objectiveApi,
    String? objectiveWeb,
    CourseDetailsModel? courseDetails,
  }) =>
      Course(
        courseId: courseId ?? this.courseId,
        courseName: courseName ?? this.courseName,
        courseBanner: courseBanner ?? this.courseBanner,
        coursePrice: coursePrice ?? this.coursePrice,
        discount: discount ?? this.discount,
        discountPrice: discountPrice ?? this.discountPrice,
        description: description ?? this.description,
        desApi: desApi ?? this.desApi,
        desWeb: desWeb ?? this.desWeb,
        objective: objective ?? this.objective,
        objectiveApi: objectiveApi ?? this.objectiveApi,
        objectiveWeb: objectiveWeb ?? this.objectiveWeb,
        courseDetails: courseDetails ?? this.courseDetails,
      );

  factory Course.fromJson(String str) => Course.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Course.fromMap(Map<String, dynamic> json) => Course(
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

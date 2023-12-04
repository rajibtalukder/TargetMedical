
import 'dart:convert';

import 'courses_model.dart';

class CourseDetailsModel {
  final int? userPayment;
  final String? courseId;
  final List<Course>? course;
  final List<CourseTeacher>? courseTeacher;
  final List<Section>? section;
  final List<VideoLecture>? videoLecture;
  final List<FileLecture>? fileLecture;
  final List<CourseBanner>? courseBanner;
  final List<CourseVideo>? courseVideo;

  CourseDetailsModel({
    this.userPayment,
    this.courseId,
    this.course,
    this.courseTeacher,
    this.section,
    this.videoLecture,
    this.fileLecture,
    this.courseBanner,
    this.courseVideo,
  });

  factory CourseDetailsModel.fromJson(String str) => CourseDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseDetailsModel.fromMap(Map<String, dynamic> json) => CourseDetailsModel(
    userPayment: json["user_payment"],
    courseId: json["course_id"],
    course: json["course"] == null ? [] : List<Course>.from(json["course"]!.map((x) => Course.fromMap(x))),
    courseTeacher: json["course_teacher"] == null ? [] : List<CourseTeacher>.from(json["course_teacher"]!.map((x) => CourseTeacher.fromMap(x))),
    section: json["section"] == null ? [] : List<Section>.from(json["section"]!.map((x) => Section.fromMap(x))),
    videoLecture: json["video_lecture"] == null ? [] : List<VideoLecture>.from(json["video_lecture"]!.map((x) => VideoLecture.fromMap(x))),
    fileLecture: json["file_lecture"] == null ? [] : List<FileLecture>.from(json["file_lecture"]!.map((x) => FileLecture.fromMap(x))),
    courseBanner: json["course_banner"] == null ? [] : List<CourseBanner>.from(json["course_banner"]!.map((x) => CourseBanner.fromMap(x))),
    courseVideo: json["course_video"] == null ? [] : List<CourseVideo>.from(json["course_video"]!.map((x) => CourseVideo.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "user_payment": userPayment,
    "course_id": courseId,
    "course": course == null ? [] : List<dynamic>.from(course!.map((x) => x.toMap())),
    "course_teacher": courseTeacher == null ? [] : List<dynamic>.from(courseTeacher!.map((x) => x.toMap())),
    "section": section == null ? [] : List<dynamic>.from(section!.map((x) => x.toMap())),
    "video_lecture": videoLecture == null ? [] : List<dynamic>.from(videoLecture!.map((x) => x.toMap())),
    "file_lecture": fileLecture == null ? [] : List<dynamic>.from(fileLecture!.map((x) => x.toMap())),
    "course_banner": courseBanner == null ? [] : List<dynamic>.from(courseBanner!.map((x) => x.toMap())),
    "course_video": courseVideo == null ? [] : List<dynamic>.from(courseVideo!.map((x) => x.toMap())),
  };
}


class CourseBanner {
  final int? courseBannerId;
  final int? courseId;
  final String? image;

  CourseBanner({
    this.courseBannerId,
    this.courseId,
    this.image,
  });

  factory CourseBanner.fromJson(String str) => CourseBanner.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseBanner.fromMap(Map<String, dynamic> json) => CourseBanner(
    courseBannerId: json["course_banner_id"],
    courseId: json["course_id"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "course_banner_id": courseBannerId,
    "course_id": courseId,
    "image": image,
  };
}

class CourseTeacher {
  final int? teacherId;
  final String? teacherName;
  final String? teacherImg;

  CourseTeacher({
    this.teacherId,
    this.teacherName,
    this.teacherImg,
  });

  factory CourseTeacher.fromJson(String str) => CourseTeacher.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseTeacher.fromMap(Map<String, dynamic> json) => CourseTeacher(
    teacherId: json["teacher_id"],
    teacherName: json["teacher_name"],
    teacherImg: json["teacher_img"],
  );

  Map<String, dynamic> toMap() => {
    "teacher_id": teacherId,
    "teacher_name": teacherName,
    "teacher_img": teacherImg,
  };
}

class CourseVideo {
  final int? courseVideoId;
  final int? courseId;
  final String? courseVideoLink;

  CourseVideo({
    this.courseVideoId,
    this.courseId,
    this.courseVideoLink,
  });

  factory CourseVideo.fromJson(String str) => CourseVideo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CourseVideo.fromMap(Map<String, dynamic> json) => CourseVideo(
    courseVideoId: json["course_video_id"],
    courseId: json["course_id"],
    courseVideoLink: json["course_video_link"],
  );

  Map<String, dynamic> toMap() => {
    "course_video_id": courseVideoId,
    "course_id": courseId,
    "course_video_link": courseVideoLink,
  };
}

class FileLecture {
  final int? fileLectureId;
  final String? fileLectureTitle;
  final String? fileLectureUrl;
  final int? public;
  final int? sectionId;
  final int? courseId;

  FileLecture({
    this.fileLectureId,
    this.fileLectureTitle,
    this.fileLectureUrl,
    this.public,
    this.sectionId,
    this.courseId,
  });

  factory FileLecture.fromJson(String str) => FileLecture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FileLecture.fromMap(Map<String, dynamic> json) => FileLecture(
    fileLectureId: json["file_lecture_id"],
    fileLectureTitle: json["file_lecture_title"],
    fileLectureUrl: json["file_lecture_url"],
    public: json["public"],
    sectionId: json["section_id"],
    courseId: json["course_id"],
  );

  Map<String, dynamic> toMap() => {
    "file_lecture_id": fileLectureId,
    "file_lecture_title": fileLectureTitle,
    "file_lecture_url": fileLectureUrl,
    "public": public,
    "section_id": sectionId,
    "course_id": courseId,
  };
}

class Section {
  final int? sectionId;
  final String? sectionTitle;
  final int? courseId;

  Section({
    this.sectionId,
    this.sectionTitle,
    this.courseId,
  });

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
    sectionId: json["section_id"],
    sectionTitle: json["section_title"],
    courseId: json["course_id"],
  );

  Map<String, dynamic> toMap() => {
    "section_id": sectionId,
    "section_title": sectionTitle,
    "course_id": courseId,
  };
}

class VideoLecture {
  final int? videoLectureId;
  final String? videoLectureTitle;
  final String? videoLectureLink;
  final int? public;
  final int? sectionId;
  final int? courseId;

  VideoLecture({
    this.videoLectureId,
    this.videoLectureTitle,
    this.videoLectureLink,
    this.public,
    this.sectionId,
    this.courseId,
  });

  factory VideoLecture.fromJson(String str) => VideoLecture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoLecture.fromMap(Map<String, dynamic> json) => VideoLecture(
    videoLectureId: json["video_lecture_id"],
    videoLectureTitle: json["video_lecture_title"],
    videoLectureLink: json["video_lecture_link"],
    public: json["public"],
    sectionId: json["section_id"],
    courseId: json["course_id"],
  );

  Map<String, dynamic> toMap() => {
    "video_lecture_id": videoLectureId,
    "video_lecture_title": videoLectureTitle,
    "video_lecture_link": videoLectureLink,
    "public": public,
    "section_id": sectionId,
    "course_id": courseId,
  };
}

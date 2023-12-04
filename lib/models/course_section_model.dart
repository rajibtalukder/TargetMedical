class CourseSectionModel {
  final String sectionTitle;
  final int sectionId;
  final List<Lecture> lectures;

  CourseSectionModel({required this.lectures,
    required this.sectionTitle,
    required this.sectionId});
}

class Lecture {
  final String data;
  final bool isVideo;
  final bool isPublic;
  final String name;
  final int id;

  Lecture({
    required this.id,
    required this.data,
    required this.isVideo,
    required this.isPublic,
    required this.name,});
}

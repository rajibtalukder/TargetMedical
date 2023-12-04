import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/course_details_model.dart';
import 'package:target_medical/models/course_section_model.dart';
import 'package:target_medical/services/core_service.dart';

class EnrolledCourseViewScreenController extends GetxController {
  RxBool loading = RxBool(true);
  RxList<CourseDetailsModel> courseDetailsList = RxList([]);
  RxList<CourseSectionModel> sections = RxList([]);
  Rx<CourseDetailsModel> details = Rx(CourseDetailsModel());
  RxString title = RxString('');

  void setData(int courseID) async {
    loading.value = true;
    sections.value = [];
    final detail = await getCourseDetails(courseID);
    if (detail != null) {
      details.value = detail;
    } else {
      final data = await getCourseDetailsFromApi(courseID);
      details.value = data!;
    }
    title.value = details.value.course![0].courseName.toString();
    await sortData();
    loading.value = false;
    update();
  }

  void setData2(String title, List<CourseSectionModel> sections) {
    loading.value = true;
    this.sections.value = [];
    this.sections.value = sections;
    this.sections.refresh();
    this.title.value = title;
    loading.value = false;
    update();
  }

  Future<CourseDetailsModel?> getCourseDetails(id) async {
    CourseDetailsModel? model;
    for (int index = 0; index < courseDetailsList.length; index++) {
      if (courseDetailsList[index].courseId! == id.toString()) {
        model = courseDetailsList[index];
        break;
      }
    }
    return model;
  }

  Future<CourseDetailsModel?> getCourseDetailsFromApi(index) async {
    CourseDetailsModel? model;

    try {
      final response = await CoreService()
          .getRequest(url: courseDetailUrl(courseId: index.toString()));
      model = CourseDetailsModel.fromMap(response.body);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
      model = null;
    }

    return model;
  }

  Future<void> sortData() async {
    final courseDetailModel = details.value;
    for (int index = 0; index < courseDetailModel.section!.length; index++) {
      final section = courseDetailModel.section![index];

      List<Lecture> fileList = [];

      for (int index = 0;
          index < courseDetailModel.videoLecture!.length;
          index++) {
        final item = courseDetailModel.videoLecture![index];
        if (item.sectionId! == section.sectionId!) {
          fileList.add(Lecture(
            id: item.videoLectureId!,
            data: item.videoLectureLink!,
            isVideo: true,
            isPublic: item.public! == 0 ? false : true,
            name: item.videoLectureTitle!,
          ));
        }
      }

      for (int index = 0;
          index < courseDetailModel.fileLecture!.length;
          index++) {
        final item = courseDetailModel.fileLecture![index];
        if (item.sectionId! == section.sectionId!) {
          fileList.add(Lecture(
            id: item.fileLectureId!,
            data: item.fileLectureUrl!,
            isVideo: false,
            isPublic: item.public! == 0 ? false : true,
            name: item.fileLectureTitle!,
          ));
        }
      }

      final courseSectionModel = CourseSectionModel(
        sectionId: section.courseId!,
        sectionTitle: section.sectionTitle!,
        lectures: fileList,
      );
      sections.add(courseSectionModel);
    }
    sections.refresh();
  }
}

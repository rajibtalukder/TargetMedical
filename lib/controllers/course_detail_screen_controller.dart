import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/course_details_model.dart';
import 'package:target_medical/models/course_section_model.dart';
import 'package:target_medical/models/courses_model.dart';
import 'package:target_medical/services/core_service.dart';
import 'package:target_medical/views/screens/buy_course/buy_course_screen.dart';
import 'package:target_medical/views/screens/enrolled_course_view/enrolled_course_view_screen.dart';

class CourseDetailScreenController extends GetxController {
  final homeController = GetControllers.instance.getHomeScreenController();
  final userController = GetControllers.instance.getUserController();

  RxBool loading = RxBool(true);
  RxBool isAlreadyBuy = RxBool(false);
  Rx<Course> course = Rx(Course());
  RxList<CourseSectionModel> sections = RxList([]);

  CourseDetailsModel get courseDetail => course.value.courseDetails!;

  void setData(Course course) async {
    loading.value = true;
    isAlreadyBuy.value = false;
    sections.value = [];
    if (course.courseDetails == null) {
      try {
        final response = await CoreService().getRequest(
            url: courseDetailUrl(courseId: course.courseId.toString()));
        final courseDetailModel = CourseDetailsModel.fromMap(response.body);
        for (int index = 0;
            index < courseDetailModel.section!.length;
            index++) {
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
                isPublic: item.public! == 0 ? true : false,
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
                isPublic: item.public! == 0 ? true : false,
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
        final index = homeController.courses.indexOf(course);
        homeController.courses[index].courseDetails = courseDetailModel;
        homeController.courses.refresh();
        this.course.value = course.copyWith(courseDetails: courseDetailModel);
      } catch (error) {
        debugPrint("Error:- ${error.toString()}");
      }
    } else {
      this.course.value = course;
      final courseDetailModel = course.courseDetails!;
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

    for (int index = 0; index < userController.usersCourses.length; index++) {
      if (userController.usersCourses[index].courseId == course.courseId) {
        isAlreadyBuy.value = true;
        break;
      }
    }

    loading.value = false;
    update();
  }

  void startCourse() {
    GetControllers.instance
        .getEnrolledCourseViewScreenController()
        .setData(course.value.courseId!);
    Get.to(() => EnrolledCourseViewScreen());
  }

  void buyCourse() {
    GetControllers.instance
        .getBuyCourseScreenController()
        .setData(course.value);
    Get.to(() => BuyCourseScreen());

  }
}

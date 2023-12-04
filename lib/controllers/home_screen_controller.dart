import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/banner_model.dart';
import 'package:target_medical/models/courses_model.dart';
import 'package:target_medical/models/live_exam_model.dart';
import 'package:target_medical/views/screens/course_detail/course_detail_screen.dart';
import 'package:target_medical/views/screens/live_exam_intro/live_exam_intro_screen.dart';
import '../models/breaking_new_model.dart';
import '../services/core_service.dart';
import '../views/dialogs/loading_dialog.dart';
import 'get_controllers.dart';

class HomeScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final examController = GetControllers.instance.getExamController();

  RxList<BannerModel> banners = RxList([]);
  RxList<Course> courses = RxList([]);
  RxList<BreakingNew> breakingNews = RxList([]);

  @override
  void onReady() async {
    await getBanner();
    await getCourses();
    await getBreakingNews();
    await examController.getLiveExams();

    super.onReady();
  }

  Future<void> getBanner() async {
    try {
      final response = await CoreService().getRequest(url: bannerUrl);

      List data = response.body['banner'];
      List<BannerModel> bannersList = [];

      for (int index = 0; index < data.length; index++) {
        bannersList.add(BannerModel.fromMap(data[index]));
      }
      banners.addAll(bannersList);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> getCourses() async {
    try {
      final response = await CoreService().getRequest(url: courseListUrl);
      final list = CoursesModel.fromMap(response.body).courses!;
      courses.addAll(list);
      courses.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> getBreakingNews() async {
    try {
      final response = await CoreService().getRequest(url: breakingNewsUrl);
      final list = BreakingNewsModel.fromJson(response.body).breakingNews;
      breakingNews.addAll(list);
      breakingNews.refresh();
      update(['breakingNewsUpdate']);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void onPressedLiveExam(LiveExam liveExam) {
    GetControllers.instance
        .getLiveExamIntroScreenController()
        .setData(liveExam);

    Get.to(() => LiveExamIntroScreen());
  }

  void gotoCourseDetail(Course course) {
    GetControllers.instance.getCourseDetailScreenController().setData(course);

    Get.to(() => CourseDetailScreen());
  }
}

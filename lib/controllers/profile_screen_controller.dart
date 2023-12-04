import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/courses_model.dart';
import 'package:target_medical/models/exam_history_model.dart';
import 'package:target_medical/models/live_exam_model.dart';
import 'package:target_medical/views/screens/live_exam_intro/live_exam_intro_screen.dart';

import '../models/expire_date_model.dart';
import '../services/core_service.dart';

class ProfileScreenController extends GetxController {
  final userController = GetControllers.instance.getUserController();
  final examController = GetControllers.instance.getExamController();
  RxList<LiveExam> liveExams = RxList([]);
  RxList<Course> courses = RxList([]);
  RxList<ExamHistory> examHistoryList = RxList([]);
  ExpireDateModel expireDateModel = ExpireDateModel();
  RxBool isLoading = false.obs;

  RxString totalExamCount = RxString('0');
  RxString liveExamCount = RxString('0');
  RxString othersExamCount = RxString('0');
  RxString totalCourseCount = RxString('0');

  @override
  Future<void> onInit() async {
    await getExpireDate();
    super.onInit();
  }

  @override
  void onReady() {
    totalExamCount.value = (userController.examHistory.value.userExam! +
            userController.examHistory.value.userLiveExam!)
        .toString();
    liveExamCount.value =
        userController.examHistory.value.userLiveExam!.toString();
    othersExamCount.value =
        userController.examHistory.value.userExam!.toString();
    totalCourseCount.value = userController.usersCourses.length.toString();

    liveExams.addAll(examController.liveExams);
    liveExams.sort((a, b) => a.schedule!.compareTo(b.schedule!));
    liveExams.refresh();
    examHistoryList.addAll(userController.examHistory.value.liveExam!);
    examHistoryList.addAll(userController.examHistory.value.exam!);
    examHistoryList
        .sort((a, b) => b.examHistoryId!.compareTo(a.examHistoryId!));
    examHistoryList.refresh();

    super.onReady();
  }

  void onPressedLiveExam(LiveExam liveExam) {
    GetControllers.instance
        .getLiveExamIntroScreenController()
        .setData(liveExam);

    Get.to(() => LiveExamIntroScreen());
  }

  Future getExpireDate() async {
    try {
      isLoading.value = true;
      final response =
      await CoreService().getRequest(url: "$expireDateUrl?user_id=${userController.userData.userId}");
      expireDateModel = ExpireDateModel.fromJson(response.body);
      isLoading.value = false;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }


}

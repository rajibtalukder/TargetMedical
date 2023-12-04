import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/exam_history_model.dart';
import 'package:target_medical/models/question_model.dart';
import 'package:target_medical/services/core_service.dart';
import 'package:target_medical/views/screens/exam_review/exam_review_screen.dart';
import 'package:target_medical/views/screens/main/main_screen.dart';

class ExamCompleteScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final userController = GetControllers.instance.getUserController();
  RxBool loading = RxBool(true);

  RxString examName = RxString('');
  RxList<QuestionModel> questions = RxList([]);
  RxInt questionCount = RxInt(0);
  RxInt time = RxInt(0);
  int currentAnsCount = 0;

  setData({
    required String examName,
    required int questionCount,
    required int time,
    required RxList<QuestionModel> questions,
    required int examId,
    required bool isLive,
  }) async {
    this.examName.value = examName;
    this.questionCount.value = questionCount;
    this.time.value = time;
    this.questions = questions;
    for (int index = 0; index < questionCount; index++) {
      final item = questions[index];
      if (item.selectedAnsIndex != null) {
        if (item.selectedAnsIndex == item.ans) {
          currentAnsCount++;
        }
      }
    }

    await submitResult(
      {
        'exam_id': examId,
        'exam_total_mark': questionCount,
        'user_mark': currentAnsCount,
        'live_exam': isLive == true ? 1 : 0,
        'user_id': userController.offlineAuth.id,
        'num_of_ques': questionCount,
      },
    );

    final examHistory = ExamHistory(
      examId: examId,
      examHistoryId: 00,
      name: examName,
      examName: examName,
      userId: int.parse(userController.offlineAuth.id),
      examTotalMark: questionCount,
      numOfQues: questionCount,
      userMark: currentAnsCount,
    );

    if (isLive) {
      userController.examHistory.value.liveExam!.add(examHistory);
    } else {
      userController.examHistory.value.exam!.add(examHistory);
    }
    userController.update();
  }

  Future<void> submitResult(Map examData) async {
    try {
      final response = await CoreService()
          .postRequest(url: examHistoryPostUrl, data: examData);
      if (jsonEncode(response.body).contains(AppString.historyAdd)) {
        loading.value = false;
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void onTapReview() {
    GetControllers.instance
        .getExamReviewScreenController()
        .setData(examName.value, questions);
    Get.to(() => ExamReviewScreen());
  }

  void onTapGoToHome() {
    GetControllers.instance
        .getMainScreenController()
        .navController
        .jumpTo(index: 0);
    Get.offAll(() => MainScreen());
  }
}

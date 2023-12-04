import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/exam_history_model.dart';
import 'package:target_medical/models/live_exam_model.dart';

import '../views/screens/exam/exam_screen.dart';

class LiveExamIntroScreenController extends GetxController {
  final userController = GetControllers.instance.getUserController();

  RxBool loading = RxBool(true);
  Rx<LiveExam> currentExam = Rx(LiveExam());
  RxBool alreadyAttended = RxBool(false);
  RxBool examStarted = RxBool(false);
  DateTime dateTime = DateTime.now();

  setData(LiveExam exam) async {
    alreadyAttended.value = false;
    examStarted.value = false;
    currentExam.value = exam;
    dateTime = exam.schedule!;

    final liveExamList = userController.examHistory.value.liveExam;
    for (int index = 0; index < liveExamList!.length; index++) {
      if (liveExamList[index].examId == exam.examId) {
        alreadyAttended.value = true;
        break;
      }
    }

    if (alreadyAttended.isFalse) {
      if (dateTime.isAfter(DateTime.now())) {
        examStarted.value = false;
      } else {
        examStarted.value = true;
      }
    }

    loading.value = false;
  }

  void goToExamScreen() {
    final controller = GetControllers.instance.getExamScreenController();

    controller.setData(
      examId: currentExam.value.examId!,
      isLiveExam: true,
      examName: currentExam.value.examName.toString(),
      questionCount: 0,
      time: 0,
      url: liveExamQuesUrl(
        examId: currentExam.value.examId.toString(),
      ),
    );
    Get.to(() => const ExamScreen());
  }
}

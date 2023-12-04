import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/question_model.dart';

class ExamReviewScreenController extends GetxController {
  RxDouble correctAns = RxDouble(0);
  RxDouble ansWithNegative = RxDouble(0);
  RxInt wrongAns = RxInt(0);
  RxInt skipAns = RxInt(0);
  RxString examName = RxString('');
  RxList<QuestionModel> questions = RxList([]);
  RxBool loading = RxBool(true);

  setData(String examName, RxList<QuestionModel> questions) {
    this.examName.value = examName;
    this.questions = questions;
    for (int index = 0; index < questions.length; index++) {
      final item = questions[index];
      if (item.selectedAnsIndex != null) {
        if (item.selectedAnsIndex == item.ans) {
          correctAns.value = correctAns.value + 1;
          ansWithNegative.value = ansWithNegative.value + 1;
        } else {
          wrongAns.value = wrongAns.value + 1;
          ansWithNegative.value = ansWithNegative.value - 0.25;
          //correctAns.value= (correctAns.value - .25);
        }
      } else {
        skipAns.value = skipAns.value + 1;
      }
    }
    loading.value = false;
    update();
  }
}

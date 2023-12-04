import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/chapter_model.dart';
import 'package:target_medical/models/exam_model.dart';
import 'package:target_medical/models/exam_type_model.dart';
import 'package:target_medical/models/subject_model.dart';
import 'package:target_medical/views/screens/exam/exam_screen.dart';

class FilterScreenController extends GetxController {
  RxString examName = RxString('');
  DateTime date = DateTime.now();

  RxDouble questionCount = RxDouble(25.0);
  RxDouble time = RxDouble(12.0);
  ExamTypeModel examType = ExamTypeModel();
  SubjectModel subject = SubjectModel();
  ChapterModel chapter = ChapterModel();
  ExamModel exam = ExamModel();
  bool isBjs = false;

  RxBool isSubjective = RxBool(true);

  setData({
    required ExamTypeModel examType,
    required SubjectModel subject,
    required ChapterModel chapter,
    required ExamModel exam,
    required bool isBjs,
    required bool isSubjective,
  }) {
    this.isSubjective.value = isSubjective;
    this.examType = examType;
    this.subject = subject;
    this.chapter = chapter;
    this.exam = exam;
    this.isBjs = isBjs;
    examName.value = examType.examTypeName!;
  }

  goToExamScreen() {
    final controller = GetControllers.instance.getExamScreenController();
    if (isSubjective.isTrue) {
      controller.setData(
        examId: 1,
        isSubjective: isSubjective.value,
        examName: examName.value,
        questionCount: questionCount.value.toInt(),
        time: time.value.toInt(),
        url: subQuesUrl(
          chapterId: chapter.chapterId.toString(),
          bjs: isBjs ? '1' : '0',
          barC: isBjs ? '0' : '1',
        ),
      );
    } else {
      controller.setData(
        examId: exam.examId!,
        isSubjective: isSubjective.value,
        examName: examName.value,
        questionCount: 0,
        time: 0,
        url: quesUrl(
          examId: exam.examId.toString(),
        ),
      );
    }

    Get.to(() => const ExamScreen());
  }
}

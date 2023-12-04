import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/chapter_model.dart';
import 'package:target_medical/models/exam_model.dart';
import 'package:target_medical/models/exam_type_model.dart';
import 'package:target_medical/models/subject_model.dart';
import 'package:target_medical/views/screens/exercise_view/exercise_view_screen.dart';
import '../views/screens/buy_package/buy_package_screen.dart';
import '../views/screens/filter/filter_screen.dart';

class ExamMenuScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final examController = GetControllers.instance.getExamController();
  final filterController = GetControllers.instance.getFilterScreenController();
  final userController = GetControllers.instance.getUserController();
  RxBool loading = RxBool(true);
  Rx<ExamTypeModel> currentType = Rx(ExamTypeModel());
  Rx<SubjectModel> currentSubject = Rx(SubjectModel());
  RxString subTitle = RxString('');
  RxString bodyTitle = RxString('');
  bool isBJS = false;
  RxBool isSubjective = RxBool(false);
  RxList<SubjectModel> subjects = RxList([]);
  RxList<ChapterModel> chapters = RxList([]);
  RxList<ExamModel> exams = RxList([]);

  setType(ExamTypeModel type, String subTitle, String bodyTitle, bool isBJS,
      bool isSubjective) async {
    chapters.value = [];
    subjects.value = [];
    this.isSubjective.value = isSubjective;
    loading.value = true;
    currentType.value = type;
    this.subTitle.value = subTitle;
    this.isBJS = isBJS;
    this.bodyTitle.value = bodyTitle;

    if (type.examTypeId == 1 || type.examTypeId == 4) {
      await examController.getSubjects();
      subjects.value = isBJS == true
          ? examController.bjsSubject
          : examController.barCouncilSubject;

      currentSubject.value = subjects.first;
      chapters.addAll(await examController.getChapters(subjects.first, isBJS));
      chapters.refresh();
    } else {
      exams.value = [];
      await examController.getExams();
      for (int index = 0; index < examController.exams.length; index++) {
        final item = examController.exams[index];
        if (item.examTypeId! == type.examTypeId) {
          if (isBJS) {
            if (item.bjs == 1) {
              exams.add(item);
            }
          } else {
            if (item.barC == 1) {
              exams.add(item);
            }
          }
        }
      }
    }

    loading.value = false;
  }

  onTapSubject(SubjectModel subject) async {
    currentSubject.value = subject;
    getSubjectChapters(subject);
  }

  getSubjectChapters(SubjectModel subject) async {
    chapters.value = [];
    if (subject.chapters!.isEmpty) {
      loading.value = true;
      chapters.addAll(await examController.getChapters(subject, isBJS));
      chapters.refresh();
      loading.value = false;
    } else {
      chapters.addAll(subject.chapters!);
      chapters.refresh();
    }
  }

  void onPressedChapter(ChapterModel chapter) {
    if (currentType.value.examTypeId == 4) {
      GetControllers.instance.getExerciseViewScreenController().setData(
            currentSubject.value.subBnName.toString(),
            chapter.chapterBnName.toString(),
            exerciseQesUrl(
              chapterId: chapter.chapterId.toString(),
              bjs: isBJS ? '1' : '0',
              barC: isBJS ? '0' : '1',
            ),
          );

      userController.userData.isPaid == 0
          ? Get.to(() => BuyPackageScreen())
          : Get.to(() => ExerciseViewScreen());
    } else {
      filterController.setData(
        examType: currentType.value,
        subject: currentSubject.value,
        chapter: chapter,
        exam: ExamModel(),
        isBjs: isBJS,
        isSubjective: isSubjective.value,
      );
      userController.userData.isPaid == 0
          ? Get.to(() => BuyPackageScreen())
          : Get.to(() => FilterScreen());
    }
  }

  void onPressedExam(ExamModel exam) {
    if (exam.examTypeId == 2) {
      filterController.setData(
        examType: currentType.value,
        subject: currentSubject.value,
        chapter: ChapterModel(),
        exam: exam,
        isBjs: isBJS,
        isSubjective: isSubjective.value,
      );
      Get.to(() => FilterScreen());
    } else {
      filterController.setData(
        examType: currentType.value,
        subject: currentSubject.value,
        chapter: ChapterModel(),
        exam: exam,
        isBjs: isBJS,
        isSubjective: isSubjective.value,
      );
      userController.userData.isPaid == 0
          ? Get.to(() => BuyPackageScreen())
          : Get.to(() => FilterScreen());
/*
      if (userController.userData.isPaid == 0) {
        Get.to(() => BuyPackageScreen());
      } else {
        if (userController.userData.isPaid! % 2 == 0 && isBJS) {
          Get.to(() => ExerciseViewScreen());
        } else {
          Get.to(() => BuyPackageScreen());
        }
      }*/
    }
  }
}

import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../models/question_model.dart';
import '../services/core_service.dart';
import '../target_medical.dart';
import '../views/screens/exam_complete/exam_complete_screen.dart';
import 'get_controllers.dart';

class ExamScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();

  RxBool loading = RxBool(true);
  RxString examName = RxString('');
  RxInt currentIndex = RxInt(0);
  RxInt selectedChoiceIndex = RxInt(0);
  RxBool isSelectAnyChoice = RxBool(false);
  CarouselController carouselController = CarouselController();
  RxString timeDisplayText = RxString('00:00');
  int questionCount = 0;
  Duration time = const Duration();
  String url = '';
  RxList<QuestionModel> questions = RxList([]);
  Rx<QuestionModel> question = Rx(QuestionModel());
  RxBool showSubmitButton = RxBool(false);
  List<int> seenQuestionIndexList = [];
  late Timer timer;
  bool isSubjective = false;
  bool isLiveExam = false;
  int examID = 1;

  //==========Changed code start
  int selectedIndex = -1.obs;
  final Map<int, int> selectedOptions = {};
  //==========updated code end

  void setData({
    required int questionCount,
    required int time,
    required String url,
    required String examName,
    required int examId,
    bool isSubjective = false,
    bool isLiveExam = false,
  }) {
    this.examName.value = examName;
    this.url = url;
    examID = examId;
    this.isSubjective = isSubjective;
    this.isLiveExam = isLiveExam;
    this.questionCount = questionCount;
    this.time = Duration(minutes: time);
  }

  /*void inIt() async {
    await getQuestions();

   question.value = questions[0];
    seenQuestionIndexList.add(0);

    if (!isSubjective) {
      time = Duration(minutes: questions.length);
    }

    loading.value = false;
    update();
    timingProcess();
  }*/

  void inIt() async {
    await getQuestions();

    if (questions != null && questions.isNotEmpty) {
      // Assuming you want to access the first question
      question.value = questions[0]; // Assign the whole QuestionModel object
      seenQuestionIndexList.add(0);

      if (!isSubjective) {
        time = Duration(minutes: questions.length);
      }

      loading.value = false;
      update();
      timingProcess();
    } else {
      // Handle the case when questions list is empty or null
      print("No questions available.");
    }
  }



  Future getQuestions() async {
    questions.value = [];
    try {
      final response = await CoreService().getRequest(url: url);
      final data = response.body as List;
      data.shuffle();

      if (!isSubjective) {
        questionCount = data.length;
      } else {
        if (data.length <= questionCount) {
          questionCount = data.length;
        }
      }

      for (int index = 0; index < questionCount; index++) {
        final item = QuestionModel.fromMap(data[index]);
        questions.add(item);
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  timingProcess() {
    int secondsRemaining = time.inSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining < 1) {
        onSubmit();
      } else {
        secondsRemaining--;
        timeDisplayText.value = _formatTime(secondsRemaining);
      }
    });
  }

  cancelExam() {
    if (timer.isActive) {
      timer.cancel();
    }
    Get.back();
    Get.back();
    Get.back();
  }

  void onSelectChoice(int index) {
    showButton();
    isSelectAnyChoice.value = true;
    selectedChoiceIndex.value = index;
    questions[currentIndex.value].selectedAnsIndex = index;
    questions.refresh();
  }

  void onTapQuestionNumber(int index) {
    currentIndex.value = index;
    final question = questions[index];
    this.question.value = question;

    if (question.selectedAnsIndex == null) {
      isSelectAnyChoice.value = false;
      selectedChoiceIndex.value = 0;
    } else {
      isSelectAnyChoice.value = true;
      selectedChoiceIndex.value = question.selectedAnsIndex!;
    }
  }

  void onSubmit() {
    timer.cancel();
    GetControllers.instance.getExamCompleteScreenController().setData(
      examName: examName.value,
      questionCount: questionCount,
      time: time.inMinutes,
      questions: questions,
      examId: examID,
      isLive: isLiveExam,
    );
    Get.to(() => ExamCompleteScreen());
  }

  void onSkip() {
    carouselController.nextPage();
    showButton();
  }

  void showButton() {
    seenQuestionIndexList.remove(currentIndex.value);
    seenQuestionIndexList.add(currentIndex.value);
    if (seenQuestionIndexList.length == questionCount) {
      showSubmitButton.value = true;
    } else {
      showSubmitButton.value = false;
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    String formattedTime =
        '${minutes.toString().padLeft(2, '0')} : ${remainingSeconds.toString().padLeft(2, '0')}';
    return formattedTime;
  }
}

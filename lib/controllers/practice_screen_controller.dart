import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';

class PracticeScreenController extends GetxController {
  final examController = GetControllers.instance.getExamController();
  final subjectWiseExamScreenController =
      GetControllers.instance.getExamMenuScreenController();

  @override
  void onReady() async {
    examController.getLiveTypes();
    super.onReady();
  }
}

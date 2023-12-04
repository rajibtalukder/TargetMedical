import 'package:get/get.dart';
import 'package:target_medical/models/free_trial_duration_model.dart';

import '../services/core_service.dart';
import '../target_medical.dart';
import 'get_controllers.dart';

class FreeTrialDurationController extends GetxController {
  final userController = GetControllers.instance.getUserController();

  @override
  Future<void> onReady() async {
    await getFreeDuration();
    // TODO: implement onReady
    super.onReady();
  }

  FreeTrialDurationModel? freeDuration;

  RxBool isLoading = false.obs;

  Future getFreeDuration() async {
    try {
      isLoading.value = true;
      final response =
          await CoreService().getRequest(url: freeTrialDurationUrl);
      freeDuration = FreeTrialDurationModel.fromJson(response.body);
      isLoading.value = false;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> postFreeTrial(int duration) async {
    try {
      final response = await CoreService().postRequest(
        url: freeTrialPostUrl,
        data: {
          'user_id': userController.userData.userId,
          'duration': duration,
        },
      );
      if (response.statusCode == 200) {
        final responseData = response.body;
        final message = responseData['msg'];
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          message, //Here should show response message
          "",
          colorText: Colors.white,
          backgroundColor: AppColors.black,
        );
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }
}

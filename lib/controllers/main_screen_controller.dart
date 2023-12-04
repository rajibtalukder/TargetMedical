import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/current_device_id_model.dart';
import 'package:target_medical/services/core_service.dart';
import 'package:target_medical/views/screens/authentication/authentication_screen.dart';
import 'package:target_medical/views/widgets/custom_bottom_navigation_bar.dart';

class MainScreenController extends GetxController {
  final userController = GetControllers.instance.getUserController();
  final loadingController = GetControllers.instance.getLoadingController();

  final CustomBottomNavigationBarController navController =
      CustomBottomNavigationBarController(initialIndex: 0);

  @override
  void onReady() {
    //checkAnotherDevice();
    super.onReady();
  }

  void checkAnotherDevice() async {
    if (userController.nowLogin) return;
    try {
      debugPrint("Checking Device Id");

      final response = await CoreService().getRequest(
        url: currentDeviceUrl(userId: userController.offlineAuth.id),
      );
      final responseBody = response.body as List;

      final data = CurrentDeviceIdModel.fromMap(responseBody.first);
      if (data.currentDeviceId != userController.deviceID) {
        await userController.clearOfflineData();
        Get.offAll(() => AuthenticationScreen());
        loadingController.setError(
          title: 'Another Device Login!',
          massage:
              'You cannot use one account on multiple devices.Log in to use your account on this device.',
        );
      } else {
        debugPrint("Device Id Matched");
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }
}

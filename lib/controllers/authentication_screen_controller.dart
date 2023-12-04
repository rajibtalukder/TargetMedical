import 'package:flutter/foundation.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/user_model.dart';
import 'package:target_medical/services/core_service.dart';
import 'package:target_medical/views/screens/main/main_screen.dart';

import '../models/forget_pass_model.dart';

class AuthenticationScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final userController = GetControllers.instance.getUserController();

  PageController pageController = PageController();
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  RxList<ForgetPassModel> forgetPassData = RxList([]);
  String getOtp ='';
  String getUserId ='';

  TextEditingController logNumberController = TextEditingController();
  TextEditingController logPasswordController = TextEditingController();
  TextEditingController regNameController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();
  TextEditingController regDobController = TextEditingController();
  TextEditingController regPasswordController = TextEditingController();
  TextEditingController collageNameController = TextEditingController();

  final logFormKey = GlobalKey<FormState>();
  final regFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    if (kDebugMode) {
      logNumberController.text = '01700000000';
      logPasswordController.text = '123456';
    }
    super.onReady();
  }

  void login() async {
    if (!logFormKey.currentState!.validate()) return;
    loadingController.show();

    try {
      final response = await CoreService().postRequest(
        url: userLoginUrl,
        data: {
          'mobile': logNumberController.text,
          'device_id': userController.deviceID,
          'password': logPasswordController.text,
        },
      );

      if (response.body['data'].contains(AppString.wrongNumberOrPassword)) {
        loadingController.setError(
          title: 'Login Failed!',
          massage: AppString.wrongNumberOrPasswordMessage,
        );
        return;
      }

      if (response.body == null) {
        loadingController.setError(
          title: 'Error Occurred!',
          massage: AppString.someIssue,
        );
        return;
      }
      final data = UserModel.fromMap(response.body).user!.first;
      userController.setUserData(data);
      userController.setOfflineData(
          userId: data.userId.toString(), isLogin: true);
      userController.nowLogin = true;
      loadingController.stop();
      Get.offAll(() => MainScreen());
    } catch (error) {
      loadingController.stop();
      debugPrint("Error:- ${error.toString()}");
      loadingController.setError(
        title: 'Login Failed!',
        massage: AppString.someIssue2,
      );
    }
  }

  void createAccount() async {
    if (!regFormKey.currentState!.validate()) return;

    loadingController.show();

    try {
      final response = await CoreService().postRequest(
        url: addUserUrl,
        data: User(
          name: regNameController.text,
          mobile: regNumberController.text,
          email: regEmailController.text,
          image: '',
          dateOfBirth: regDobController.text,
          deviceId: userController.deviceID,
          password: regPasswordController.text,
        ).toMap(),
      );

      if (jsonEncode(response.body).contains(AppString.alreadyUserNumber)) {
        loadingController.setError(
          title: 'Registration Failed!',
          massage: AppString.alreadyUserNumber,
        );
        return;
      }
      if (jsonEncode(response.body).contains(AppString.alreadyUseDevice)) {
        loadingController.setError(
          title: 'Registration Failed!',
          massage: AppString.alreadyUseDevice,
        );
        return;
      }

      if (response.body == null) {
        loadingController.setError(
          title: 'Error Occurred!',
          massage: AppString.someIssue,
        );
        return;
      }
      final data = UserModel.fromMap(response.body).user!.first;
      userController.setUserData(data);
      userController.setOfflineData(
          userId: data.userId.toString(), isLogin: true);
      userController.nowLogin = true;
      loadingController.stop();
      Get.offAll(() => MainScreen());
    } catch (error) {
      loadingController.stop();
      debugPrint("Error:- ${error.toString()}");
      loadingController.setError(
        title: 'Registration Failed!',
        massage: AppString.someIssue2,
      );
    }
  }

  void forgetPassword(String mobileNum) async {
    try {
      var response = await CoreService()
          .getRequest(url: '$forgetPassUrl?mobile=$mobileNum');
      if (response.body == null) {
        loadingController.setError(
          title: 'Error Occurred!',
          massage: AppString.someIssue,
        );
        return;
      }
      getOtp = response.body['data']['otp'].toString();
      getUserId = response.body['data']['user_id'].toString();
      print(getOtp);
    } catch (error) {
      loadingController.stop();
      debugPrint("Error:- ${error.toString()}");
      loadingController.setError(
        title: 'Failed!',
        massage: AppString.someIssue2,
      );
    }
  }

  void setNewPassword(String password)async{
    try{
      var response = await CoreService().postRequest(url: '$setNewPassUrl?user_id=$getUserId', data: {
        'new_password' : password
      });
      if (response.body == null) {
        loadingController.setError(
          title: 'Error Occurred!',
          massage: AppString.someIssue,
        );
        return;
      }
      print(response.body['message']);
    }catch (error) {
      loadingController.stop();
      debugPrint("Error:- ${error.toString()}");
      loadingController.setError(
        title: 'Registration Failed!',
        massage: AppString.someIssue2,
      );
    }
  }


}

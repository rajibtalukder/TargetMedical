import 'package:get/get.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/auth_model.dart';
import 'package:target_medical/models/exam_history_model.dart';
import 'package:target_medical/models/user_course_model.dart';
import 'package:target_medical/models/user_model.dart';
import 'package:target_medical/services/core_service.dart';

import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/courses_model.dart';

class UserController extends GetxController {
  String deviceID = '';
  AuthModel offlineAuth = AuthModel.empty();
  Rx<User> user = Rx(User());
  Rx<ExamHistoryModel> examHistory = Rx(ExamHistoryModel());
  RxList<UserCourseModel> usersCourses = RxList([]);

  User get userData => user.value;
  bool nowLogin = false;

  Future<void> getUserData() async {
    await getDeviceID();
    await getOfflineData();
    await getProfileData();
    await getUserExamData();
    await getUserCourses();
  }

  Future<void> getDeviceID() async {
    final mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();
    deviceID = base64.encode(utf8.encode(mobileDeviceIdentifier!));
    // deviceID='254e1adcf2c9475996d7dc749eb41903617b0573';
    debugPrint("This Device Id: $deviceID");
  }

  Future<void> getOfflineData() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('user_id') ?? '';
    bool isLoggedInO = prefs.getBool('is_login') ?? false;
    offlineAuth = AuthModel(
      id: id,
      isLoggedIn: isLoggedInO,
    );
  }

  Future<void> getProfileData() async {
    if (offlineAuth.isLoggedIn == false) return;

    try {
      final response = await CoreService()
          .getRequest(url: profileUrl(userId: offlineAuth.id));
      final data = UserModel.profileFromMap(response.body).user!.first;
      setUserData(data);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> getUserExamData() async {
    if (offlineAuth.isLoggedIn == false) return;

    try {
      final response = await CoreService()
          .getRequest(url: examHistoryUrl(userId: offlineAuth.id));
      final data = ExamHistoryModel.fromMap(response.body);
      examHistory.value = data;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> getUserCourses() async {
    if (offlineAuth.isLoggedIn == false) return;

    try {
      final response = await CoreService()
          .getRequest(url: userCoursesUrl(userId: offlineAuth.id));
      // .getRequest(url: userCoursesUrl(userId: '35'));
      final data = response.body as List;
      for (int index = 0; index < data.length; index++) {
        usersCourses.add(UserCourseModel.fromMap(data[index]));
      }
      usersCourses.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> setOfflineData(
      {required String userId, required bool isLogin}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    await prefs.setBool('is_login', isLogin);
    offlineAuth = AuthModel(
      id: userId,
      isLoggedIn: isLogin,
    );
  }

  Future<void> clearOfflineData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', '');
    await prefs.setBool('is_login', false);
    offlineAuth = AuthModel.empty();
  }

  setUserData(User user) {
    this.user.value = user;
    update();
  }
}

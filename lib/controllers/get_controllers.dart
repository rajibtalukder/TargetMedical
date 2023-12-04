import 'package:get/get.dart';
import 'package:target_medical/controllers/free_trial_duration_controller.dart';
import 'authentication_screen_controller.dart';
import 'books_screen_controller.dart';
import 'buy_course_screen_controller.dart';
import 'buy_package_screen_controller.dart';
import 'check_result_screen_controller.dart';
import 'courses_screen_controller.dart';
import 'course_detail_screen_controller.dart';
import 'edit_profile_screen_controller.dart';
import 'enrolled_course_view_screen_controller.dart';
import 'exam_complete_screen_controller.dart';
import 'exam_controller.dart';
import 'exam_menu_screen_controller.dart';
import 'exam_review_screen_controller.dart';
import 'exam_screen_controller.dart';
import 'exercise_view_screen_controller.dart';
import 'favourite_screen_controller.dart';
import 'filter_screen_controller.dart';
import 'forget_password_screen_controller.dart';
import 'home_screen_controller.dart';
import 'live_exam_intro_screen_controller.dart';
import 'loading_controller.dart';
import 'login_screen_controller.dart';
import 'main_screen_controller.dart';
import 'notes_screen_controller.dart';
import 'packages_screen_controller.dart';
import 'pdf_view_screen_controller.dart';
import 'practice_screen_controller.dart';
import 'profile_screen_controller.dart';
import 'resource_screen_controller.dart';
import 'social_media_screen_controller.dart';
import 'terms_and_condition_screen_controller.dart';
import 'user_controller.dart';
import 'video_view_screen_controller.dart';


class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();

  GetControllers._internal();

  static GetControllers get instance => _singleton;

  
  AuthenticationScreenController getAuthenticationScreenController() {
    if (!Get.isRegistered<AuthenticationScreenController>()) {
      Get.put(AuthenticationScreenController());
    }
    return Get.find<AuthenticationScreenController>();
  }
          
  BooksScreenController getBooksScreenController() {
    if (!Get.isRegistered<BooksScreenController>()) {
      Get.put(BooksScreenController());
    }
    return Get.find<BooksScreenController>();
  }
          
  BuyCourseScreenController getBuyCourseScreenController() {
    if (!Get.isRegistered<BuyCourseScreenController>()) {
      Get.put(BuyCourseScreenController());
    }
    return Get.find<BuyCourseScreenController>();
  }
          
  CoursesScreenController getCoursesScreenController() {
    if (!Get.isRegistered<CoursesScreenController>()) {
      Get.put(CoursesScreenController());
    }
    return Get.find<CoursesScreenController>();
  }
  BuyPackageScreenController getBuyPackageScreenController() {
    if (!Get.isRegistered<BuyPackageScreenController>()) {
      Get.put(BuyPackageScreenController());
    }
    return Get.find<BuyPackageScreenController>();
  }
          
  CourseDetailScreenController getCourseDetailScreenController() {
    if (!Get.isRegistered<CourseDetailScreenController>()) {
      Get.put(CourseDetailScreenController());
    }
    return Get.find<CourseDetailScreenController>();
  }
          
  EditProfileScreenController getEditProfileScreenController() {
    if (!Get.isRegistered<EditProfileScreenController>()) {
      Get.put(EditProfileScreenController());
    }
    return Get.find<EditProfileScreenController>();
  }
          
  EnrolledCourseViewScreenController getEnrolledCourseViewScreenController() {
    if (!Get.isRegistered<EnrolledCourseViewScreenController>()) {
      Get.put(EnrolledCourseViewScreenController());
    }
    return Get.find<EnrolledCourseViewScreenController>();
  }
          
  ExamCompleteScreenController getExamCompleteScreenController() {
    if (!Get.isRegistered<ExamCompleteScreenController>()) {
      Get.put(ExamCompleteScreenController());
    }
    return Get.find<ExamCompleteScreenController>();
  }
          
  ExamController getExamController() {
    if (!Get.isRegistered<ExamController>()) {
      Get.put(ExamController());
    }
    return Get.find<ExamController>();
  }
          
  ExamMenuScreenController getExamMenuScreenController() {
    if (!Get.isRegistered<ExamMenuScreenController>()) {
      Get.put(ExamMenuScreenController());
    }
    return Get.find<ExamMenuScreenController>();
  }
          
  ExamReviewScreenController getExamReviewScreenController() {
    if (!Get.isRegistered<ExamReviewScreenController>()) {
      Get.put(ExamReviewScreenController());
    }
    return Get.find<ExamReviewScreenController>();
  }
          
  ExamScreenController getExamScreenController() {
    if (!Get.isRegistered<ExamScreenController>()) {
      Get.put(ExamScreenController());
    }
    return Get.find<ExamScreenController>();
  }

  FavouriteScreenController getFavouriteScreenController() {
    if (!Get.isRegistered<FavouriteScreenController>()) {
      Get.put(FavouriteScreenController());
    }
    return Get.find<FavouriteScreenController>();
  }
          
  ExerciseViewScreenController getExerciseViewScreenController() {
    if (!Get.isRegistered<ExerciseViewScreenController>()) {
      Get.put(ExerciseViewScreenController());
    }
    return Get.find<ExerciseViewScreenController>();
  }
          
  FilterScreenController getFilterScreenController() {
    if (!Get.isRegistered<FilterScreenController>()) {
      Get.put(FilterScreenController());
    }
    return Get.find<FilterScreenController>();
  }
          
  ForgetPasswordScreenController getForgetPasswordScreenController() {
    if (!Get.isRegistered<ForgetPasswordScreenController>()) {
      Get.put(ForgetPasswordScreenController());
    }
    return Get.find<ForgetPasswordScreenController>();
  }
          
  HomeScreenController getHomeScreenController() {
    if (!Get.isRegistered<HomeScreenController>()) {
      Get.put(HomeScreenController());
    }
    return Get.find<HomeScreenController>();
  }
          
  LiveExamIntroScreenController getLiveExamIntroScreenController() {
    if (!Get.isRegistered<LiveExamIntroScreenController>()) {
      Get.put(LiveExamIntroScreenController());
    }
    return Get.find<LiveExamIntroScreenController>();
  }
          
  LoadingController getLoadingController() {
    if (!Get.isRegistered<LoadingController>()) {
      Get.put(LoadingController());
    }
    return Get.find<LoadingController>();
  }
          
  LoginScreenController getLoginScreenController() {
    if (!Get.isRegistered<LoginScreenController>()) {
      Get.put(LoginScreenController());
    }
    return Get.find<LoginScreenController>();
  }
          
  MainScreenController getMainScreenController() {
    if (!Get.isRegistered<MainScreenController>()) {
      Get.put(MainScreenController());
    }
    return Get.find<MainScreenController>();
  }
          
  NotesScreenController getNotesScreenController() {
    if (!Get.isRegistered<NotesScreenController>()) {
      Get.put(NotesScreenController());
    }
    return Get.find<NotesScreenController>();
  }
          
  PackagesScreenController getPackagesScreenController() {
    if (!Get.isRegistered<PackagesScreenController>()) {
      Get.put(PackagesScreenController());
    }
    return Get.find<PackagesScreenController>();
  }
          
  PdfViewScreenController getPdfViewScreenController() {
    if (!Get.isRegistered<PdfViewScreenController>()) {
      Get.put(PdfViewScreenController());
    }
    return Get.find<PdfViewScreenController>();
  }
          
  PracticeScreenController getPracticeScreenController() {
    if (!Get.isRegistered<PracticeScreenController>()) {
      Get.put(PracticeScreenController());
    }
    return Get.find<PracticeScreenController>();
  }
          
  ProfileScreenController getProfileScreenController() {
    if (!Get.isRegistered<ProfileScreenController>()) {
      Get.put(ProfileScreenController());
    }
    return Get.find<ProfileScreenController>();
  }
          
  ResourceScreenController getResourceScreenController() {
    if (!Get.isRegistered<ResourceScreenController>()) {
      Get.put(ResourceScreenController());
    }
    return Get.find<ResourceScreenController>();
  }
          
  SocialMediaScreenController getSocialMediaScreenController() {
    if (!Get.isRegistered<SocialMediaScreenController>()) {
      Get.put(SocialMediaScreenController());
    }
    return Get.find<SocialMediaScreenController>();
  }
          
  TermsAndConditionScreenController getTermsAndConditionScreenController() {
    if (!Get.isRegistered<TermsAndConditionScreenController>()) {
      Get.put(TermsAndConditionScreenController());
    }
    return Get.find<TermsAndConditionScreenController>();
  }
          
  UserController getUserController() {
    if (!Get.isRegistered<UserController>()) {
      Get.put(UserController());
    }
    return Get.find<UserController>();
  }
          
  VideoViewScreenController getVideoViewScreenController() {
    if (!Get.isRegistered<VideoViewScreenController>()) {
      Get.put(VideoViewScreenController());
    }
    return Get.find<VideoViewScreenController>();
  }

  CheckResultScreenController getCheckResultController() {
    if (!Get.isRegistered<CheckResultScreenController>()) {
      Get.put(CheckResultScreenController());
    }
    return Get.find<CheckResultScreenController>();
  }


  FreeTrialDurationController getFreeTrialDurationController() {
    if (!Get.isRegistered<FreeTrialDurationController>()) {
      Get.put(FreeTrialDurationController());
    }
    return Get.find<FreeTrialDurationController>();
  }
  
}
    
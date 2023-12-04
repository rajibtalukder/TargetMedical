import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/loading_controller.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/courses_model.dart';
import 'package:target_medical/models/payment_method_model.dart';
import 'package:target_medical/models/user_course_model.dart';
import 'package:target_medical/services/core_service.dart';

class BuyCourseScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final userController = GetControllers.instance.getUserController();
  final courseDetailController =
      GetControllers.instance.getCourseDetailScreenController();
  final profileController =
      GetControllers.instance.getProfileScreenController();

  RxBool loading = RxBool(true);
  Rx<Course> course = Rx(Course());

  Course get courseData => course.value;
  RxList<PaymentMethod> paymentMethods = RxList([]);
  int paymentMethodIndex = 0;
  TextEditingController senderNumber = TextEditingController();
  TextEditingController trxId = TextEditingController();

  final formKey = GlobalKey<FormState>();

  setData(Course course) async {
    loading.value = true;
    this.course.value = course;
    await getPaymentMethods();
    loading.value = false;
    update();
  }

  Future getPaymentMethods() async {
    if (paymentMethods.isNotEmpty) return;
    try {
      final response = await CoreService().getRequest(url: paymentMethodUrl);
      final data = PaymentMethodModel.fromMap(response.body).paymentMethod!;

      paymentMethods.addAll(data);
      paymentMethods.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    loadingController.show();

    try {
      final response = await CoreService().postRequest(
        url: coursePaymentUrl(userId: userController.offlineAuth.id),
        data: {
          'payment_method_id': paymentMethods[paymentMethodIndex].id,
          'tnx_id': trxId.text,
          'sender_number': senderNumber.text,
          'amount': courseData.discount! == 0
              ? courseData.discountPrice
              : courseData.discountPrice,
          'course_id': courseData.courseId,
        },
      );

      if (response.body.contains(AppString.coursePaymentInsert)) {
        loadingController.setError(
            title: 'Course purchase successful!',
            massage: 'Congratulations you have successfully purchased this course',
            onPressed: () {
              courseDetailController.isAlreadyBuy.value = true;

              userController.usersCourses.add(
                UserCourseModel(
                  coursePaymentListId: 0,
                  userId: int.parse(userController.offlineAuth.id),
                  courseId: courseData.courseId,
                  courseName: courseData.courseName,
                  courseBanner: courseData.courseBanner,
                  coursePrice: courseData.coursePrice,
                  discount: courseData.discount,
                  discountPrice: courseData.discountPrice,
                  description: courseData.description,
                  desApi: courseData.desApi,
                  desWeb: courseData.desWeb,
                  objective: courseData.objective,
                  objectiveApi: courseData.objectiveApi,
                  objectiveWeb: courseData.objectiveWeb,
                ),
              );
              userController.refresh();
              profileController.totalCourseCount.value =
                  userController.usersCourses.length.toString();
              Get.back();
              Get.back();
            });
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
      loadingController.setError(
        title: 'Course purchase failed!',
        massage: AppString.someIssue2,
      );
    }
  }
}

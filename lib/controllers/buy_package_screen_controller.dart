
import 'package:get/get.dart';

import '../models/courses_model.dart';
import '../models/package_model.dart';
import '../models/payment_method_model.dart';
import '../services/core_service.dart';
import '../target_medical.dart';
import 'get_controllers.dart';

class BuyPackageScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final userController = GetControllers.instance.getUserController();
  // final courseDetailController =
  // GetControllers.instance.getCourseDetailScreenController();
  final profileController =
  GetControllers.instance.getProfileScreenController();

  RxBool loading = RxBool(true);
  RxString packageAmount = ''.obs;
  RxList<PaymentMethod> paymentMethods = RxList([]);
  RxList<Package> package = RxList([]);
  int paymentMethodIndex = 0;
  var packageMethodIndex = 0.obs;
  TextEditingController senderNumber = TextEditingController();
  TextEditingController trxId = TextEditingController();

  final formKey = GlobalKey<FormState>();


  setData(Course course) async {
    loading.value = true;
    //this.course.value = course;
    await getPaymentMethods();
    loading.value = false;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getPaymentMethods();
    getPackage();
    super.onInit();
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

  Future getPackage() async {
    if (package.isNotEmpty) return;
    try {
      final response = await CoreService().getRequest(url: packageUrl);
      final data = PackageModel.fromMap(response.body).packageList!;
      package.addAll(data);
      package.refresh();
      print(package[0].amount);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    loadingController.show();

    try {
      final response = await CoreService().postRequest(
        url: paymentPostUrl(userId: userController.offlineAuth.id),
        data: {
          'payment_method_id': paymentMethods[paymentMethodIndex].id,
          'tnx_id': trxId.text,
          'sender_number': senderNumber.text,
          'amount' : packageAmount.value,
          'membership_plan_id': '1',
          'package_id' : package[packageMethodIndex.value].packageId
        },
      );
      if(response.isOk){
        loadingController.stop();
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          "আপনার পেমেন্টটি গ্রহণ করা হয়েছে। অনুগ্রহ পূর্বক অপেক্ষা করুন।",
          "",
          colorText: Colors.white,
          backgroundColor: AppColors.black,
        );
        userController.getProfileData();
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

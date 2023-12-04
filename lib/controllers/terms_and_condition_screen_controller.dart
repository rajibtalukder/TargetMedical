import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';

import '../models/about_us_model.dart';
import '../services/core_service.dart';

class TermsAndConditionScreenController extends GetxController {
  RxList<AboutUs> aboutUs = RxList([]);
  RxBool isLoading = false.obs;

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    await getAboutUs();
    super.onReady();
  }

  Future getAboutUs() async {
    if (aboutUs.isNotEmpty) return;
    try {
      isLoading.value=true;
      final response = await CoreService().getRequest(url: aboutUsUrl);
      final data = AboutUsModel.fromJson(response.body).aboutUs;
      aboutUs.addAll(data);
      aboutUs.refresh();
      isLoading.value=false;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }
}

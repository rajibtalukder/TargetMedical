import 'package:get/get.dart';
import 'package:target_medical/target_medical.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/social_media_model.dart';
import '../services/core_service.dart';

class SocialMediaScreenController extends GetxController {
  RxList<SocialMedia> socialMediaList = RxList([]);

  @override
  void onReady() async {
    getData();
    super.onReady();
  }

  void getData() async {
    try {
      final socialResponse = await CoreService().getRequest(url: socialMediaUrl);
      final socialModel = SocialMediaModel.fromMap(socialResponse.body);
      socialMediaList.addAll(socialModel.socialMedia!);
      socialMediaList.refresh();
      update(['socialMediaUpdate']);
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  void openUrl() async {
    String url = socialMediaList[0].linkOrNumber.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
 
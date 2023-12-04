import 'package:get/get.dart';
import 'package:target_medical/models/favourite_qus_model.dart';
import '../services/core_service.dart';
import '../target_medical.dart';
import '../utils/api_urls.dart';
import 'get_controllers.dart';

class FavouriteScreenController extends GetxController {

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
     await getFavQuestions();
    super.onInit();
  }
  final userController = GetControllers.instance.getUserController();

  RxList<FavouriteQusModel> favQuestions = RxList([]);


  Future<void> addFavourite(String mcqId) async {
    try {
      final response = await CoreService().postRequest(
          url: '$favouritePostUrl?user_id=${userController.userData.userId}', data: {'mcq_id': mcqId});
      if (response.statusCode == 200) {
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          "Added on Favourite",
          "",
          colorText: Colors.white,
          backgroundColor: AppColors.black,
        );
      }
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<void> getFavQuestions() async {
    try {
      final response = await CoreService().getRequest(
          url: '$favouriteGetUrl?user_id=${userController.userData.userId}');

      // Convert List<dynamic> to List<FavouriteQusModel>
      List<FavouriteQusModel> favQuestionsList =
      List<FavouriteQusModel>.from(response.body.map(
              (item) => FavouriteQusModel.fromMap(item as Map<String, dynamic>)));

      favQuestions.value = favQuestionsList;
    } catch (error) {
      debugPrint("Error: ${error.toString()}");
    }
  }

}

import 'package:image_picker/image_picker.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/services/core_service.dart';

class EditProfileScreenController extends GetxController {
  final loadingController = GetControllers.instance.getLoadingController();
  final userController = GetControllers.instance.getUserController();
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  Rx<XFile?> selectedImage = Rx(null);

  @override
  void onInit() {
    nameController.text = userController.userData.name!;
    emailController.text = userController.userData.email!;
    dobController.text = userController.userData.dateOfBirth!;
    super.onInit();
  }

  void onSelectImage() async {
    selectedImage.value = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
  }

  void submit() async {
    if (!formKey.currentState!.validate()) return;
    try {
      loadingController.show();

      final response = await CoreService().postEditUserInfoRequest(
        url: profileUpdateUrl(userId: userController.offlineAuth.id),
        name: nameController.text,
        email: emailController.text,
        dateOfBirth: dobController.text,
        imageFile: selectedImage.value,
        imageUrl: userController.userData.image!,
        password: userController.userData.password!,
      );
      if (jsonEncode(response.body).contains(AppString.userUpdateSuccessful)) {
        await userController.getProfileData();

        loadingController.stop();
        Get.back();
      } else {
        loadingController.setError(
          title: 'Error Occurred!',
          massage: AppString.someIssue,
        );
      }
    } catch (error) {
      loadingController.stop();
      debugPrint("Error:- ${error.toString()}");
    }
  }
}

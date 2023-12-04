import 'package:get/get.dart';

import '../views/dialogs/loading_dialog.dart';

class LoadingController extends GetxController {
  LoadingDialogController loading = LoadingDialogController();

  RxBool get isLoading => RxBool(loading.isLoading);
  RxBool isWidgetLoading = RxBool(false);

  void startWidgetLoading() {
    isWidgetLoading.value = true;
  }

  void stopWidgetLoading() {
    isWidgetLoading.value = false;
  }

  void show() {
    LoadingShow();
  }

  void stop() {
    loading.close();
  }

  void setError({
    required String title,
    required String massage,
    Function? onPressed,
  }) {
    if (isLoading.isTrue) {
      loading.setError(title: title, massage: massage, onPressed: onPressed);
    } else {
      show();
      loading.setError(title: title, massage: massage, onPressed: onPressed);
    }
  }
}

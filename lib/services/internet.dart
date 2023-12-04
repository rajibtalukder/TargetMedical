import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/dialogs/alert_dialog_loader.dart';
import '../views/dialogs/no_internet_dialog.dart';

class Internet {
  Internet._();

  static Future<bool> hasInternet() async {
    debugPrint('Internet Connection Massage : Checking...');
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      debugPrint(
          'Internet Connection Massage : Device have internet connection');

      return true;
    } else {
      debugPrint(
          'Internet Connection Massage : Device does not have internet connection');
      AlertDialogLoader.load(dialog: NoInternetDialog(
        onPressed: () async {
          await hasInternet();
          Get.back();
        },
      ));
      return false;
    }
  }
}

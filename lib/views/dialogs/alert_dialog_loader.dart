import 'package:get/get.dart';
import 'package:target_medical/target_medical.dart';

class AlertDialogLoader {
  AlertDialogLoader._();

  static load({
    required Widget dialog,
    bool isDismissible = true,
  }) {
    Navigator.of(AppKeys.navigation.currentContext!).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (BuildContext context, _, __) {
          return WillPopScope(
            onWillPop: ()async{
              return isDismissible;
            },
            child: Scaffold(
              appBar: AppAppBarStyles.transparent,
              backgroundColor: Colors.black26,
              body: Container(
                height: AppSize.height,
                width: AppSize.width,
                alignment: Alignment.center,
                child: dialog,
              ),
            ),
          );
        },
      ),
    );
  }
}



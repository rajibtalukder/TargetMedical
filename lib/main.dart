import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/views/screens/authentication/authentication_screen.dart';
import 'package:target_medical/views/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetControllers.instance.getUserController().getUserData();
  runApp(TargetMedical());
}

class TargetMedical extends StatelessWidget {
  TargetMedical({Key? key}) : super(key: key);

  final userController = GetControllers.instance.getUserController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        builder: (context, widget) {
          return GetMaterialApp(
            title: 'Target Medical',
            debugShowCheckedModeBanner: false,
            navigatorKey: AppKeys.navigation,
            theme: ThemeData(
              // ignore: deprecated_member_use
              androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            ),
            home: widget,
          );
        },
      child: userController.offlineAuth.isLoggedIn
          ? MainScreen()
          : AuthenticationScreen(),

    );
  }
}

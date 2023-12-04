import 'package:target_medical/target_medical.dart';

class AppAppBarStyles {
  AppAppBarStyles._();

  static AppBar get splash => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarDividerColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get blue => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.blue,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.blue,
          systemNavigationBarColor: AppColors.blue,
          systemNavigationBarDividerColor: AppColors.blue,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      );

  static AppBar get black => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.black,
          systemNavigationBarColor: AppColors.black,
          systemNavigationBarDividerColor: AppColors.black,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      );

  static AppBar get white => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.white,
          systemNavigationBarColor: AppColors.white,
          systemNavigationBarDividerColor: AppColors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get lightBlueAccent => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightBlueAccent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.lightBlueAccent,
          systemNavigationBarColor: AppColors.lightBlueAccent,
          systemNavigationBarDividerColor: AppColors.lightBlueAccent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );

  static AppBar get transparent => AppBar(
        toolbarHeight: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
      );
}

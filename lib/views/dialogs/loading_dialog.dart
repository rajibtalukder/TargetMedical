import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/target_medical.dart';

class LoadingDialogController {
  ValueNotifier<bool> _showError = ValueNotifier(false);
  final ValueNotifier<bool> _showLoading = ValueNotifier(true);
  String? _title;
  String? _massage;
  String? _label;
  Function? _onPressed;
  bool _isLoading = true;

  bool get isLoading => _showError.value;

  bool get hasError => _showError.value;

  void close() {
    Get.back();
    _isLoading = false;
    _showError = ValueNotifier(false);
  }

  void setError(
      {required String title,
      required String massage,
      String? label,
      Function? onPressed}) {
    _title = title;
    _massage = massage;
    _label = label;
    _onPressed = onPressed;
    _showError.value = !_showError.value;
    debugPrint('Error Title : $title\nError Massage : $massage');
  }

  void removeError() {
    _showError.value = false;
  }

  void show() {
    _isLoading = true;
    _showLoading.value = true;
  }

  void hide() {
    _isLoading = false;
    _showLoading.value = false;
  }
}

class LoadingShow {
  LoadingShow({
    bool onlyBlankScreen = false,
  }) {
    final context = AppKeys.navigation.currentContext as BuildContext;
    final controller = GetControllers.instance.getLoadingController().loading;
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (BuildContext context, _, __) {
          controller._isLoading = true;
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: onlyBlankScreen == false
                ? _LoadingDialog(
                    controller: controller,
                  )
                : Container(),
          );
        },
      ),
    );
  }
}

class _LoadingDialog extends StatefulWidget {
  final LoadingDialogController controller;

  const _LoadingDialog({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<_LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<_LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Colors.black26,
      body: Container(
        height: AppSize.height,
        width: AppSize.width,
        alignment: Alignment.center,
        child: _mainUi(context),
      ),
    );
  }

  Widget _mainUi(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller._showError,
      builder: (BuildContext context, bool value, Widget? child) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 280),
          switchInCurve: Curves.fastOutSlowIn,
          child: value ? errorWidget() : progressIndicatorWidget(),
        );
      },
    );
  }

  Widget progressIndicatorWidget() {
    return SizedBox(
      width: 45.h,
      height: 45.h,
      child: CircularProgressIndicator(
        color: AppColors.black,
        strokeWidth: 5.w,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget errorWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.controller._title ?? '',
            style: AppTextStyles.semiBold18.copyWith(

              color: AppColors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            widget.controller._massage ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold14.copyWith(
              color: AppColors.gray,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.liAdorNoirritRegular,
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {
              if (widget.controller._onPressed != null) {
                widget.controller._onPressed!();
              }
              widget.controller.close();
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.black,
              ),
              child: Text(
                widget.controller._label ?? 'Close',
                style: AppTextStyles.semiBold16.copyWith(
                  color: AppColors.white,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

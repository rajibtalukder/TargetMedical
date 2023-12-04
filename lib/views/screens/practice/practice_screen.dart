import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/practice_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/views/widgets/common_header_widget.dart';

import 'components/option_exam_widget.dart';

class PracticeScreen extends StatelessWidget {
  PracticeScreen({Key? key}) : super(key: key);

  final PracticeScreenController controller =
      GetControllers.instance.getPracticeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const CommonHeaderWidget(),
            SizedBox(height: 20.h),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                color: AppColors.white2,
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: 16.h),
                    OptionExamWidget(
                      //title: 'বার কাউন্সিল পরীক্ষা',
                      title: 'মেডিকেল এডভান্স প্রিপারেশন(HSC)',
                      isBGJ: false,
                    ),
                    SizedBox(height: 34.h),
                    OptionExamWidget(
                     // title: 'বি জে এস পরীক্ষা',
                      title: 'মেডিকেল এডমিশন প্রিপারেশন',
                      isBGJ: true,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/home_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:target_medical/views/screens/buy_package/buy_package_screen.dart';
import 'package:target_medical/views/widgets/common_header_widget.dart';

import 'components/courses_widget.dart';
import 'components/image_slider_widget.dart';
import 'components/live_mcq_exam_widget.dart';
  
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  
  final HomeScreenController controller =
      GetControllers.instance.getHomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarStyles.white,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 16.h),
             const CommonHeaderWidget(
               showNews: true,
             ),
            SizedBox(height: 20.h),
            ImageSliderWidget(),
            SizedBox(height: 24.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              color: AppColors.white2,
              child: Column(
                children: [
                  //CoursesWidget(),
                  SizedBox(height: 24.h),
                  LiveMCQExamWidget(),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

  
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/resource_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/views/screens/resource/components/code_number_widget.dart';
import 'package:target_medical/views/screens/resource/components/routine_widget.dart';
import 'package:target_medical/views/widgets/common_header_widget.dart';

import 'components/book_widget.dart';
import 'components/note_widget.dart';
  
class ResourceScreen extends StatelessWidget {
  ResourceScreen({Key? key}) : super(key: key);
  
  final ResourceScreenController controller =
      GetControllers.instance.getResourceScreenController();
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
                    // SizedBox(height: 16.h),
                    // ClassRecordWidget(),
                    // SizedBox(height: 18.h),
                    // RoutingWidget(),
                    // SizedBox(height:38.h),
                    // CodeNumberWidget(),
                    SizedBox(height: 24.h),
                    BookWidget(),
                    SizedBox(height: 24.h),
                    NoteWidget(),
                    SizedBox(height: 24.h),
                    // GradientButton(
                    //   name: 'অন্যান্য',
                    //   onPressed: () {},
                    // ),
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

  
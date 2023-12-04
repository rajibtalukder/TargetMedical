import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:target_medical/constants/constant.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/profile_screen_controller.dart';

import '../../../styles/text_styles.dart';
import 'chart_widget.dart';
import 'scoreboard_widget.dart';
import 'upcoming_exam_widget.dart';

class ProfileDashboardWidget extends StatelessWidget {
  ProfileDashboardWidget({Key? key}) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 16.h),
          ScoreboardWidget(),
          SizedBox(height: 24.h),
          UpComingExamWidget(),
          SizedBox(height: 24.h),
          // ChartWidget(),
        ],
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:target_medical/controllers/profile_screen_controller.dart';
import 'package:target_medical/target_medical.dart';

class ProfileHistoryWidget extends StatelessWidget {
  ProfileHistoryWidget({Key? key}) : super(key: key);

  final ProfileScreenController controller =
      GetControllers.instance.getProfileScreenController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 10.h),
        historyItemWidget(
          mark: 'সঠিক উত্তর',
          name: 'পরীক্ষার নাম',
          totalMark: 'মোট প্রশ্ন',
        ),
        Obx(()=> ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: controller.examHistoryList.length,
            itemBuilder: (context, index) {
              final item = controller.examHistoryList[index];
              return Column(
                children: [
                  Divider(color: AppColors.gray,thickness: 1),
                  historyItemWidget(
                    mark: item.userMark.toString(),
                    name: item.examName.toString(),
                    totalMark: item.examTotalMark.toString(),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return historyItemWidget(
          mark: '২২/০২/২৩',
          name: 'পরীক্ষার নাম',
          totalMark: 'অনুত্তীর্ণ',
        );
      },
    );
  }

  Widget historyItemWidget({
    required String name,
    required String mark,
    required String totalMark,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name,
              textAlign: TextAlign.start,
              style: AppTextStyles.semiBold14.copyWith(color: AppColors.black),
            ),
          ),
          SizedBox(
              height:20.h,
              child: VerticalDivider(thickness: 1,color: AppColors.gray)),
          Expanded(
            flex: 2,
            child: Text(
              totalMark,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold14.copyWith(color: AppColors.pink),
            ),
          ),
          SizedBox(
              height:20.h,
              child: VerticalDivider(thickness: 1,color: AppColors.gray)),
          Expanded(
            flex: 2,
            child: Text(
              mark,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold14.copyWith(color: AppColors.green),
            ),
          ),
        ],
      ),
    );
  }
}

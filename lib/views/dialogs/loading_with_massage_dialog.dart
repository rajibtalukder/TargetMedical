// import 'package:get/get.dart';
// import 'package:ron_e_world/controllers/get_controllers.dart';
// import 'package:ron_e_world/controllers/superstar_registration_screen_controller.dart';
// import 'package:shimmer/shimmer.dart';
//
//
// class LoadingWithMassageDialog extends StatelessWidget {
//   LoadingWithMassageDialog({
//     Key? key,
//   }) : super(key: key);
//
//   final SuperstarRegistrationScreenController controller =
//       GetControllers.shared.getSuperstarRegistrationScreenController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 14.w),
//       padding: EdgeInsets.symmetric(horizontal: 46.w, vertical: 36.h),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(13.r),
//         color: AppColors.white,
//       ),
//       child: Shimmer.fromColors(
//         baseColor: AppColors.blue,
//         highlightColor: AppColors.gray.withOpacity(0.6),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() {
//               return Text(
//                 '${controller.progressUploading}%',
//                 style: AppTextStyles.semiBold14,
//               );
//             }),
//             SizedBox(height: 12.h),
//             Text(
//               'Video Uploading...',
//               textAlign: TextAlign.center,
//               style: AppTextStyles.body2.copyWith(color: AppColors.gray),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

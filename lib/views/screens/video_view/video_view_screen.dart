import 'package:flick_video_player/flick_video_player.dart';
import 'package:target_medical/target_medical.dart';
import 'package:target_medical/controllers/video_view_screen_controller.dart';
import 'package:target_medical/controllers/get_controllers.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoViewScreen extends StatefulWidget {
  final String url;
  final String name;

  const VideoViewScreen({Key? key, required this.url, required this.name})
      : super(key: key);

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late FlickManager flickManager;

  final VideoViewScreenController controller =
      GetControllers.instance.getVideoViewScreenController();

  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        widget.url,
      ),
      autoPlay: false,
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarDividerColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: VisibilityDetector(
        key: ObjectKey(flickManager),
        onVisibilityChanged: (visibility) {
          // if (visibility.visibleFraction == 0 && mounted) {
          //   flickManager.flickControlManager?.autoPause();
          // } else if (visibility.visibleFraction == 1) {
          //   flickManager.flickControlManager?.autoResume();
          // }
        },
        child: ColoredBox(
          color: AppColors.yellow,
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(8.r),
            child: Theme(
              data: ThemeData(
                primaryColor: AppColors.black,
                progressIndicatorTheme:
                    ProgressIndicatorThemeData(color: AppColors.black),
              ),
              child: FlickVideoPlayer(
                flickManager: flickManager,
                preferredDeviceOrientation: const [
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft
                ],
                systemUIOverlay: [],
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickLandscapeControls(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

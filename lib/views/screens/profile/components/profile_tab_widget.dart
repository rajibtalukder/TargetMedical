import 'package:target_medical/target_medical.dart';

class ProfileTabWidget extends StatefulWidget {
  final List<Widget> screens;

  const ProfileTabWidget({Key? key, required this.screens}) : super(key: key);

  @override
  State<ProfileTabWidget> createState() => _ProfileTabWidgetState();
}

class _ProfileTabWidgetState extends State<ProfileTabWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: AppColors.white2,
            child: TabBar(
                labelPadding: EdgeInsets.zero,
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.black,
                ),
                tabs: [
                  tabWidget('ড্যাশবোর্ড', 0),
                  tabWidget('কোর্স সমূহ', 1),
                  tabWidget('হিস্টোরি', 2),
                  tabWidget('নিজ', 3),
                ]),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: widget.screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget tabWidget(String name, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.5.h),
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        duration: const Duration(milliseconds: 260),
        child: tabController.index == index
            ? Text(
                name,
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.white,
                ),
              )
            : Text(
                name,
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.black,
                ),
              ),
      ),
    );
  }
}

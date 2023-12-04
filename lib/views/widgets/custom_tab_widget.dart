import 'package:target_medical/target_medical.dart';
import 'package:target_medical/models/subject_model.dart';

class CustomTabWidget extends StatefulWidget {
  final List<SubjectModel> subjects;
  final Function(SubjectModel subject) onPressedTab;

  const CustomTabWidget({
    Key? key,
    required this.subjects,
    required this.onPressedTab,
  }) : super(key: key);

  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    tabController = TabController(length: widget.subjects.length, vsync: this)
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
    if (widget.subjects.isEmpty) {
      return Container();
    }
    return Container(
      alignment: Alignment.centerLeft,
      child: TabBar(
          labelPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: AppColors.black,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 4.w),
          isScrollable: true,
          onTap: (index) {
            widget.onPressedTab(widget.subjects[index]);
          },
          tabs: [
            for (int index = 0; index < widget.subjects.length; index++)
              tabWidget(widget.subjects[index], index),
          ]),
    );
  }

  Widget tabWidget(SubjectModel subject, int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.black,width: 1)
      ),
      padding: EdgeInsets.all(5.h),
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        duration: const Duration(milliseconds: 260),
        child: tabController.index == index
            ? Text(
                subject.subBnName.toString(),
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.black,
                ),
              )
            : Text(
                subject.subBnName.toString(),
                style: AppTextStyles.semiBold13.copyWith(
                  color: AppColors.gray,
                ),
              ),
      ),
    );
  }
}

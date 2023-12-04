import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef ItemBuilder = Widget Function(CustomBNBItem item);

enum IconType { png, svg, iconData }

class CustomBottomNavigationBarController {
  int initialIndex;

  late PageController _pageController;
  late ValueNotifier<int> _currentIndex;

  CustomBottomNavigationBarController({this.initialIndex = 0,bool keepPage =false}) {
    _pageController = PageController(initialPage: initialIndex,keepPage: keepPage);
    _currentIndex = ValueNotifier(initialIndex);
  }

  int get currentIndex => _currentIndex.value;

  PageController get pageController => _pageController;

  jumpTo({required int index}) {
    _currentIndex.value = index;
    _pageController.jumpToPage(_currentIndex.value);
  }

  animateTo(
      {required int index, required Duration duration, required Curve curve}) {
    _currentIndex.value = index;
    _pageController.animateToPage(_currentIndex.value,
        duration: duration, curve: curve);
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final List<CustomBNBItem> items;
  final ItemBuilder activeStyle;
  final ItemBuilder inactiveStyle;
  final Function()? onPressed;
  final Function(int index)? onChange;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final CustomBottomNavigationBarController controller;
  final EdgeInsetsGeometry? padding;

  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.activeStyle,
    required this.inactiveStyle,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    this.onChange,
    required this.controller,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
      ),
      alignment: Alignment.center,
      child: ValueListenableBuilder(
        valueListenable: widget.controller._currentIndex,
        builder: (BuildContext context, int value, Widget? child) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int index = 0; index < widget.items.length; index++)
                _button(item: widget.items[index], index: index),
            ],
          );
        },
      ),
    );
  }

  Widget _button({required CustomBNBItem item, required int index}) {
    if (widget.controller._currentIndex.value == index) {
      return Expanded(child: widget.activeStyle(item.copyWith(index: index)));
    }

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.selectionClick();
          if (widget.onPressed != null) {
            widget.onPressed!();
            return;
          }

          widget.controller.jumpTo(index: index);
        },
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.zero),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0.0),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: widget.inactiveStyle(item.copyWith(index: index)),
      ),
    );
  }
}

class CustomBNBItem {
  final IconType type;
  final dynamic icon;
  final dynamic inactiveIcon;
  final String title;
  final int index;

  CustomBNBItem({
    this.type = IconType.iconData,
    this.icon = Icons.question_mark,
    this.title = 'Item',
    this.inactiveIcon = Icons.question_mark,
    this.index = 0,
  });
}

extension CustomBNBItemExtension on CustomBNBItem {
  CustomBNBItem copyWith({
    IconType? type,
    dynamic icon,
    dynamic inactiveIcon,
    String? title,
    int? index,
  }) {
    return CustomBNBItem(
      type: type ?? this.type,
      icon: icon ?? this.icon,
      inactiveIcon: inactiveIcon ?? this.inactiveIcon,
      title: title ?? this.title,
      index: index ?? this.index,
    );
  }
}

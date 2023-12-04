import 'package:flutter/material.dart';

class ExpandWidget extends StatefulWidget {
  final bool expand;
  final Widget child;
  final Duration? duration;
  final Axis axis;

  const ExpandWidget({
    Key? key,
    required this.expand,
    required this.child,
    this.duration,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  ExpandWidgetStateful createState() => ExpandWidgetStateful();
}

class ExpandWidgetStateful extends State<ExpandWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 700));
    animation = CurvedAnimation(
        parent: expandController,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn);
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.axis,
      sizeFactor: animation,
      child: AnimatedOpacity(
        duration: widget.duration ?? const Duration(milliseconds: 700),
        opacity: widget.expand ? 1.0 : 0.0,
        curve: Curves.fastOutSlowIn,
        child: widget.child,
      ),
    );
  }
}

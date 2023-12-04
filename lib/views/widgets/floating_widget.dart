import 'package:flutter/material.dart';


class FloatingWidget extends StatefulWidget {
  final Widget floatingChild;
  final Widget floatingBody;
  final AlignmentGeometry? alignment;
  final double? gap;

  const FloatingWidget(
      {Key? key,
      required this.floatingChild,
      required this.floatingBody,
      this.alignment,
      this.gap})
      : super(key: key);

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget> {
  final GlobalKey _childKey = GlobalKey();
  Size _childSize = const Size(0, 0);
  EdgeInsetsGeometry padding = EdgeInsets.zero;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _childSize = _childKey.currentContext!.size!;
      padding = await _getPadding();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.alignment ?? Alignment.topCenter,
      children: [
        Padding(
          padding: padding,
          child: widget.floatingBody,
        ),
        Container(key: _childKey, child: widget.floatingChild)
      ],
    );
  }

  Future<EdgeInsetsGeometry> _getPadding() async {
    final currentAlignment = widget.alignment ?? Alignment.topCenter;

    Alignment alignment = currentAlignment as Alignment;

    if (alignment.y == -1.0) {
      final padding = widget.gap ?? _childSize.height / 2;
      return EdgeInsets.only(top: padding);
    } else if (alignment.y == 1.0) {
      final padding = widget.gap ?? _childSize.height / 2;
      return EdgeInsets.only(bottom: padding);
    } else if (alignment == Alignment.center) {
      return EdgeInsets.zero;
    } else if (alignment.x == -1.0) {
      final padding = widget.gap ?? _childSize.width / 2;
      return EdgeInsets.only(left: padding);
    } else if (alignment.x == 1.0) {
      final padding = widget.gap ?? _childSize.width / 2;
      return EdgeInsets.only(right: padding);
    } else {
      return EdgeInsets.zero;
    }
  }
}

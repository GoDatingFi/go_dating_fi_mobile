import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.isSupperLike})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget icon;
  final bool isSupperLike;

  @override
  Widget build(BuildContext context) {
    if (isSupperLike) {
      return SizedBox(
        width: 100.sm,
        height: 100.sm,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: icon,
          iconSize: 64.sm,
        ),
      );
    } else {
      return Card(
        elevation: 1.sm,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        child: IconButton(
          padding: const EdgeInsets.all(10),
          onPressed: onPressed,
          icon: icon,
          iconSize: 34.sm,
        ),
      );
    }
  }
}

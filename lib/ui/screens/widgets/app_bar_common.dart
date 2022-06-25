import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/text_style.dart';

AppBar appBarCommon(BuildContext context,
    {String? strAvatar,
    String? strName,
    String? strStatus,
    String? strDescription,
    String? textStories,
    String? textInteract,
    int? countStories,
    int? countInteract,
    bool? isHide = true,
    bool? isIconBack = false,
    VoidCallback? onPressed}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    //// hides leading widget
    elevation: 0,
    centerTitle: true,
    title: Text(
      strName ?? "",
      style: TextStyles.textSize18T,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

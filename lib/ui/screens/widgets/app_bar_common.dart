import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/constants.dart';
import 'utils/text_style.dart';

AppBar appBarCommon(BuildContext context,
    {bool isBackScreen = false, String? strName, VoidCallback? onPressed}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: isBackScreen,
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

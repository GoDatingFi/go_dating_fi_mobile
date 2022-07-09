import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../widgets/app_bar_common.dart';
import '../widgets/language/languages.dart';
import '../widgets/utils/common.dart';

class HobbyScreen extends StatefulWidget {
  const HobbyScreen({Key? key}) : super(key: key);

  @override
  _HobbyState createState() => _HobbyState();
}

class _HobbyState extends State<HobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBarCommon(context, strName: Languages.of(context)!.titleHobby),
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 10.sm, left: 5.sm, right: 5.sm, bottom: 10.sm),
              child: Wrap(
                  direction: Axis.horizontal,
                  children: List<Widget>.generate(
                      Languages.of(context)!.listHobby.length,
                      (j) => Container(
                          margin: EdgeInsets.all(5.sm),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.sm, horizontal: 10.sm),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99.sm),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colours.TIME_COLOR, spreadRadius: 1),
                            ],
                          ),
                          child: Text(
                            Languages.of(context)!.listHobby[j],
                            style: TextStyles.textBold18RTextName,
                          )))),
            ),
            Positioned(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: 50.sm, left: 16.sm, right: 16.sm),
                      child: Common().buttonCommon(
                          strTitle: Languages.of(context)!.textContinue,
                          dHeight: 32.h,
                          onClick: () {}),
                    )))
          ],
        ));
  }
}

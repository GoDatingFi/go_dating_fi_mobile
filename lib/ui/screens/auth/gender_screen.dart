import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/app_bar_common.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';

import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/common.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  late TextEditingController _userNameController;
  late TextEditingController _birthDayController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _birthDayController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCommon(context,
          strName: Languages.of(context)!.titleGender, isBackScreen: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(24.sm)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 40.h),
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsUtils.MALE,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            Languages.of(context)!.titleMale,
                            style: TextStyles.textBold14T,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(24.sm)),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 40.h),
                      child: Column(
                        children: [
                          Image.asset(
                            AssetsUtils.FE_MALE,
                            fit: BoxFit.fill,
                            alignment: Alignment.center,
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            Languages.of(context)!.titleFemale,
                            style: TextStyles.textBold14T,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sm),
                  child: Common().editTextCommon(
                      hintValue: Languages.of(context)!.phoneNumber,
                      wLeft: SvgPicture.asset(
                        AssetsUtils.USER_ICON,
                      ),
                      controller: _userNameController),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.sm),
                  child: Common().editTextCommon(
                      hintValue: Languages.of(context)!.phoneNumber,
                      wLeft: SvgPicture.asset(
                        AssetsUtils.GIFT_ICON,
                      ),
                      wRight: SvgPicture.asset(
                        AssetsUtils.CALENDAR_ICON,
                      ),
                      controller: _birthDayController),
                ),
              ],
            ),
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
      ),
    );
  }
}

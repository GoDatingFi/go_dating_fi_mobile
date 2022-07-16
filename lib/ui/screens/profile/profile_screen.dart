import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/colors.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../widgets/utils/assets_utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.BG_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: SizedBox(
                    width: 0.95.sw,
                    child:
                        Image.asset(AssetsUtils.CARD_IMAGE, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    bottom: -80.sm,
                    child: CircleAvatar(
                        radius: 78.sm,
                        backgroundColor: Colours.MAIN_COLOR,
                        child: CircleAvatar(
                          radius: 75.sm,
                          backgroundImage:
                              const AssetImage("assets/images/Addison.jpg"),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 40.sm,
                              height: 40.sm,
                              child: CircleAvatar(
                                  radius: 38.sm,
                                  child: Container(
                                    padding: EdgeInsets.all(2.sm),
                                    width: 38.sw,
                                    height: 38.sh,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                          colors: [
                                            Colours.COLOR_GRADIEN_1,
                                            Colours.COLOR_GRADIEN_2
                                          ],
                                          begin: FractionalOffset(0.0, 0.0),
                                          end: FractionalOffset(0.5, 0.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                    ),
                                    child: Icon(Icons.camera_alt),
                                  )),
                            ),
                          ),
                        )))
              ],
            ),
            SizedBox(height: 80.sm),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Anny, 30",
                    style: TextStyles.textSize24S,
                  ),
                  SizedBox(width: 5.w),
                  SvgPicture.asset(
                    AssetsUtils.CHECK,
                  )
                ],
              ),
            ),
            SizedBox(height: 10.sm),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsUtils.LOCATION,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    "New York",
                    style: TextStyles.text14R,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.sm),
            _accountSetting(),
            _discovery()
          ],
        ),
      ),
    );
  }

  Widget _accountSetting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0.05.sw),
          child: Text(
            "ACCOUNT SETTINGS",
            style: TextStyles.textSize12r,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16.r),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone number", style: TextStyles.textSize16T),
                        Row(
                          children: [
                            Text(
                              "0987654321",
                              style: TextStyles.textBold16TextNormal,
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Connected accounts",
                            style: TextStyles.textSize16T),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email", style: TextStyles.textSize16T),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _discovery() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 0.05.sw),
          child: Text(
            "DISCOVERY",
            style: TextStyles.textSize12r,
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16.r),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Locations", style: TextStyles.textSize16T),
                        Row(
                          children: [
                            Text(
                              "New York",
                              style: TextStyles.textBold16TextNormal,
                            ),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance preference",
                            style: TextStyles.textSize16T),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    SfSlider(
                      min: 0,
                      max: 100,
                      value: 40,
                      interval: 20,
                      showTicks: false,
                      showLabels: true,
                      enableTooltip: false,
                      showDividers: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {});
                      },
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Only show people in this range",
                            style: TextStyles.textSize16T),
                        CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Distance preference",
                            style: TextStyles.textSize16T),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Age prefecence", style: TextStyles.textSize16T),
                      ],
                    ),
                    SfSlider(
                      min: 18,
                      max: 100,
                      value: 18,
                      interval: 20,
                      showTicks: false,
                      showLabels: true,
                      enableTooltip: false,
                      showDividers: true,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {});
                      },
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Only show people in this range",
                            style: TextStyles.textSize16T),
                        CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Global", style: TextStyles.textSize16T),
                        CupertinoSwitch(
                          value: false,
                          onChanged: (value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

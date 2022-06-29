import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/text_style.dart';
import 'package:location/location.dart';

import '../widgets/utils/assets_utils.dart';
import '../widgets/utils/common.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  @override
  void initState() {
    super.initState();
  }

  void _getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200.sm),
              child: Text(
                Languages.of(context)!.titleLocation,
                style: TextStyles.textSize34S,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sm),
              child: Text(
                Languages.of(context)!.desLocation,
                textAlign: TextAlign.center,
                style: TextStyles.textBold12RText,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.all(10.sm),
              width: 250.w,
              height: 200.w,
              child: Image.asset(
                AssetsUtils.IMAGES_LOCATION,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(height: 70.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sm),
              child: Common().buttonCommon(
                  strTitle: Languages.of(context)!.buttonLocation,
                  dHeight: 32.h,
                  onClick: () async {
                    _getLocation();
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}

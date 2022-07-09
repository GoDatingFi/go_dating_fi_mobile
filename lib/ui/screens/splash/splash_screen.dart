import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/assets_utils.dart';
import 'package:logger/logger.dart';

import '../../../core/utils/auth_utils.dart';
import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _counter = 3;
  late Timer _timer;

  void _startTimer() {
    _counter = 3;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        // var token = await AuthUtils.instance.getToken();
        // Logger().d(token);
        // if (token != null && token.isNotEmpty) {
        //   NavigatorUtils.pushReplaceRemoveAll(
        //       context, RouterGenerator.routeHome);
        // } else {
        //   NavigatorUtils.pushReplaceRemoveAll(
        //       context, RouterGenerator.routeLogin);
        // }
        NavigatorUtils.pushReplaceRemoveAll(
            context, RouterGenerator.routeDetailSwipeScreen);
      }
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            width: 0.4.sw,
            height: 0.4.sw,
            child: Image.asset(
              AssetsUtils.LOGO_SPLASH,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
        ));
  }
}

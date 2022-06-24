import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/assets_utils.dart';

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
        NavigatorUtils.pushReplacementNamed(
            context, RouterGenerator.routeChatScreen);
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
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Image.asset(
          AssetsUtils.LOGO,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

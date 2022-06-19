import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/language_provider.dart';
import 'injector.dart';
import 'ui/router/router_generator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp(
                title: "GoDatingFi",
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: "Mulish",
                  scaffoldBackgroundColor: Colors.white,
                ),
                initialRoute: RouterGenerator.routeChatScreen,
                onGenerateRoute: RouterGenerator.generateRoute)));
  }
}

enum Swipe { left, right, none }

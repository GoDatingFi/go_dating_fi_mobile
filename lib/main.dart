import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_dating_fi_mobile/core/services/auth/auth_services.dart';
import 'package:go_dating_fi_mobile/core/services/dating/dating_services.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/auth_provider.dart';
import 'package:go_dating_fi_mobile/core/viewmodels/dating_provider.dart';
import 'package:provider/provider.dart';

import 'injector.dart';
import 'ui/router/router_generator.dart';
import 'ui/screens/widgets/language/locale_constant.dart';
import 'ui/screens/widgets/language/localizations_delegate.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => DatingProvider()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => MaterialApp(
                title: "GoDatingFi",
                debugShowCheckedModeBanner: false,
                locale: _locale,
                theme: ThemeData(
                  fontFamily: "Sen",
                  scaffoldBackgroundColor: Colors.white,
                ),
                initialRoute: RouterGenerator.routeSplash,
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('vn', ''),
                ],
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  for (var supportedLocale in supportedLocales) {
                    if (supportedLocale.languageCode == locale?.languageCode &&
                        supportedLocale.countryCode == locale?.countryCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                onGenerateRoute: RouterGenerator.generateRoute)));
  }
}

enum Swipe { left, right, none }

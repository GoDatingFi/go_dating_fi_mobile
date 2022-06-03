import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/splash/splash_screen.dart';
import '404.dart';

class RouterGenerator {
  //* Routing list
  static const routeHome = "/home";
  static const routeSplash = "/splash";
  static const routeQRCode = "/Qrcode";
  static const routeLogin = "/Login";
  static const routeRegister = "/Register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeHome:
        // TODO return Home Screenxs
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => WidgetNotFound());
  }
}

import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/ui/screens/chat/chat_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/chat/socket_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/swipe/swipe_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/wallet/wallet_screen.dart';
import 'package:local_auth/local_auth.dart';
import '../screens/auth/auth_local_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/pair/devices_list_screen.dart';
import '../screens/splash/splash_screen.dart';
import '404.dart';

class RouterGenerator {
  //* Routing list
  static const routeHome = "/home";
  static const routeSplash = "/splash";
  static const routeQRCode = "/Qrcode";
  static const routeLogin = "/Login";
  static const routeRegister = "/Register";
  static const routeBrowser = "/RouterBrowser";
  static const routeAdvertiser = "/RouterAdvertiser";
  static const routeSwipeCard = "/RouteSwipeScreen";
  static const routeAuthLocal = "/AuthLocalScreen";
  static const routeSocketScreen = "/RouteSocketScreen";
  static const routeWalletScreen = "/RouterWalletScreen";
  static const routeChatScreen = "/RouterChatScreen";

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
      case routeBrowser:
        return MaterialPageRoute(
            builder: (_) =>
                const DevicesListScreen(deviceType: DeviceType.browser));
      case routeAdvertiser:
        return MaterialPageRoute(
            builder: (_) =>
                const DevicesListScreen(deviceType: DeviceType.advertiser));
      case routeSwipeCard:
        return MaterialPageRoute(builder: (_) => const SwipeScreen());
      case routeSocketScreen:
        return MaterialPageRoute(builder: (_) => const SocketScreen());
      case routeAuthLocal:
        return MaterialPageRoute(builder: (_) => const AuthLocalScreen());
      case routeWalletScreen:
        return MaterialPageRoute(builder: (_) => const WalletScreen());
      case routeChatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      default:
        break;
    }
    return MaterialPageRoute(builder: (_) => WidgetNotFound());
  }
}

enum DeviceType { advertiser, browser }

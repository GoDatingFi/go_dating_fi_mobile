import 'package:flutter/material.dart';

class NavigatorUtils {
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false, Object? data}) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamed(context, path, arguments: data);
  }

  static pushReplacementNamed(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Navigator.pushReplacementNamed(context, path, arguments: null);
  }

  static pushReplaceRemoveAll(BuildContext context,  String path,) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
  }

  /// return
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  /// return with parameters
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// jump to WebView page
  static goWebViewPage(BuildContext context, String title, String url) {
    // push(context, RouterGenerator.routeWebview);
  }
}

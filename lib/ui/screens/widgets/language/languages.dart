import 'package:flutter/material.dart';

abstract class Languages {
  static Languages? of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelInfo;

  String get labelSelectLanguage;

  String get matches;

  String get phoneNumber;

  String get password;

  String get forgotPassword;

  String get login;

  String get loginWith;

  String get newMember;

  String get register;
}

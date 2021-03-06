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

  String get hi;

  String get titleWelcome;

  String get titleSelectZodiac;

  String get textAries;

  String get textTaurus;

  String get textGemini;

  String get textCancer;

  String get textLeo;

  String get textVirgo;

  String get textLibra;

  String get textScorpio;

  String get textSagittarius;

  String get textCapricorus;

  String get textAquarius;

  String get textPisces;

  String get textContinue;

  String get textLoading;

  String get errLogin;

  String get titleLocation;

  String get desLocation;

  String get buttonLocation;

  String get titleGender;

  String get titleMale;

  String get titleFemale;

  String get nickName;

  String get birthDay;

  String get addPhotos;

  List<String> get listHobby;

  String get titleHobby;

  String get titleCreateAccount;

  String get desCreateAccount;

  String get titleVerification;

  String get desVerification;

  String get resentOTP;

  String get titlePasswordSetup;

  String get desPasswordSetup;

  String get titleCreatePassword;

  String get titleConfirmPassword;

}

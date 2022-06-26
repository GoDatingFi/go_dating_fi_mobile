import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/model/user_data_model.dart';

import '../../injector.dart';
import '../services/auth/auth_services.dart';

abstract class AuthModel extends ChangeNotifier {}

class AuthProvider extends AuthModel {
  UserDataModel? _userDataModel;

  UserDataModel? get userDataModel => _userDataModel;

  AuthServices authServices = locator<AuthServices>();

  void login(
      BuildContext context, String strUserName, String strPassword) async {
    _userDataModel =
        await authServices.login(context, strUserName, strPassword);
    notifyListeners();
  }
}

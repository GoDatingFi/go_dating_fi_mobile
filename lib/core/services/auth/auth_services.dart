import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/model/nonce_data_model.dart';
import 'package:go_dating_fi_mobile/core/model/user_data_model.dart';
import 'package:go_dating_fi_mobile/core/utils/auth_utils.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/dialog/loading_screen.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/language/languages.dart';
import 'package:go_dating_fi_mobile/ui/screens/widgets/utils/common.dart';
import 'package:logger/logger.dart';

import '../../../ui/router/fluro_navigator.dart';
import '../../../ui/router/router_generator.dart';
import '../../../ui/screens/widgets/utils/constants.dart';
import '../../config/api.dart';
import '../base/base_services.dart';

class AuthServices extends BaseServices {
  static const String USERNAME_PARAMETER = "username";
  static const String PASSWORD_PARAMETER = "password";
  static const String ADDRESS_PARAMETER = "walletAddress";

  Future<UserDataModel> login(
      BuildContext context, String strUserName, String strPassword) async {
    var resp = await request(Api.instance.login, RequestType.POST, context,
        data: {
          USERNAME_PARAMETER: strUserName,
          PASSWORD_PARAMETER: strPassword
        },
        useToken: false);
    LoadingScreen().hide();
    UserDataModel loginModel = UserDataModel.fromJson(resp);
    if (loginModel.data != null && loginModel.data!.token != null) {
      await Common().setSharedPreferences(
          Constants.TOKEN_PARAMETER, loginModel.data!.token);
      AuthUtils.instance.setToken(loginModel.data!.token!);
      NavigatorUtils.pushReplaceRemoveAll(context, RouterGenerator.routeHome);
      return loginModel;
    } else {
      Common().showToastErr(Languages.of(context)!.errLogin);
    }
    return loginModel;
  }

  Future<NonceDataModel> getNonce(BuildContext context, String address) async {
    var resp = await request(Api.instance.getNonce, RequestType.POST, context,
        data: {
          ADDRESS_PARAMETER: address,
        },
        useToken: true);
    NonceDataModel nonceDataModel = NonceDataModel.fromJson(resp);

    return nonceDataModel;
  }

}

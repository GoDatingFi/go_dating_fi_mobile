import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/model/user_data_model.dart';

import '../../config/api.dart';
import '../base/base_services.dart';

class AuthServices extends BaseServices {
  Future<UserDataModel> login(BuildContext context,  String strUserName, String strPassword) async {
    var resp = await request(Api.instance.login, RequestType.POST, context,
        useToken: false);

    UserDataModel userDataModel = UserDataModel.fromJson(resp);
    return userDataModel;
  }
}

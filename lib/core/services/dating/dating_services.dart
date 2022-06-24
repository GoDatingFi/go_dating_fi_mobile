import 'package:flutter/material.dart';
import 'package:go_dating_fi_mobile/core/model/dating/list_image_swipe_model.dart';

import '../../config/api.dart';
import '../base/base_services.dart';

class DatingServices extends BaseServices {
  Future<ListImageSwipeModel> getListImageSwipe(BuildContext context) async {
    var resp = await request(Api.instance.listImage, RequestType.GET, context,
        useToken: false);

    ListImageSwipeModel listImageSwipeModel = ListImageSwipeModel();
    return listImageSwipeModel;
  }
}

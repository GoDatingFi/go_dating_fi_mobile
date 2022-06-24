import 'package:flutter/material.dart';

import '../../injector.dart';
import '../model/dating/list_image_swipe_model.dart';
import '../services/dating/dating_services.dart';

abstract class DatingModel extends ChangeNotifier {}

class DatingProvider extends DatingModel {
  ListImageSwipeModel? _listImageSwipeModel;

  ListImageSwipeModel? get listImageSwipeModel => _listImageSwipeModel;

  DatingServices datingServices = locator<DatingServices>();

  void getImageForSwipe(BuildContext context) async {
    _listImageSwipeModel = await datingServices.getListImageSwipe(context);
    notifyListeners();
  }
}

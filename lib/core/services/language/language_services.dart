import 'package:flutter/material.dart';
import '../../config/api.dart';
import '../../model/language_collection_model.dart';
import '../base/base_services.dart';

class LanguageServices extends BaseServices {
  Future<LanguageCollectionModel> getCollectionLanguage(
      BuildContext context) async {
    var resp = await request(
        Api.instance.getLanguageCollection, RequestType.GET, context,
        useToken: false);

    LanguageCollectionModel languageCollectionModel =
        LanguageCollectionModel.fromJson(resp);
    return languageCollectionModel;
  }
}

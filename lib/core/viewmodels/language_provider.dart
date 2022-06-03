import 'package:flutter/material.dart';

import '../../injector.dart';
import '../model/base_language_content_model.dart';
import '../model/language_collection_model.dart';
import '../services/language/language_services.dart';

abstract class LanguageModel extends ChangeNotifier {}

class LanguageProvider extends LanguageModel {
  LanguageCollectionModel? _languageCollectionModel;

  LanguageCollectionModel? get languageCollectionModel =>
      _languageCollectionModel;

  BaseLanguageContentModel? _baseLanguageContentModel;

  BaseLanguageContentModel? get baseLanguageContentModel =>
      _baseLanguageContentModel;

  LanguageValue? languageValue;

  LanguageServices languageServices = locator<LanguageServices>();

  void getLanguageCollection(BuildContext context) async {
    _languageCollectionModel =
        await languageServices.getCollectionLanguage(context);
    notifyListeners();
  }
}

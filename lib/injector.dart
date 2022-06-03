import 'package:get_it/get_it.dart';

import 'core/services/language/language_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerSingleton(LanguageServices());
}

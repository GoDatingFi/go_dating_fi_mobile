import 'package:get_it/get_it.dart';
import 'package:go_dating_fi_mobile/core/services/auth/auth_services.dart';
import 'package:go_dating_fi_mobile/core/services/dating/dating_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() async {
  locator.registerSingleton(AuthServices());
  locator.registerSingleton(DatingServices());
}

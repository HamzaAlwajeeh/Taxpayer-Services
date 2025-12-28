import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  // getIt.registerSingleton<ApiService>(ApiService(Dio()));
  // getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(getIt<ApiService>()));
}

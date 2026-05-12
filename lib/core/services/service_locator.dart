import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile_repo_impl.dart';
import 'package:tax_payer/core/services/api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<ApiService>()));
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(getIt<ApiService>()));
}

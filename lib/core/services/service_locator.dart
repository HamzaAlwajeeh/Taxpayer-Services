import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo_impl.dart';
import 'package:tax_payer/Features/Home/data/repos/user_file_repo.dart';
import 'package:tax_payer/Features/Home/data/repos/user_file_repo_impl.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo_impl.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile_repo_impl.dart';
import 'package:tax_payer/core/services/api_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<ApiService>()));
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl(getIt<ApiService>()));
  getIt.registerSingleton<NewFileRepo>(NewFileRepoImpl(getIt<ApiService>()));
  getIt.registerSingleton<UserFileRepo>(UserFileRepoImpl(getIt<ApiService>()));
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/services/api_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class AuthRepoImpl implements AuthRepo {
  ApiService apiService;
  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, User>> login({
    required String userName,
    required String password,
  }) async {
    try {
      var data = await apiService.post(
        endPoint: AppConstants.kLogin,
        body: {'userName': userName, 'password': password},
        token: null,
      );

      final loginData = data['data'] as Map<String, dynamic>;
      final accessToken = loginData['access_token'] as String;
      User user = User.fromJson(loginData['user'] as Map<String, dynamic>);

      Prefs.setString(AppConstants.kToken, accessToken);

      return Right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required File idCard,
    required String phone,
    required File image,
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      await apiService.post(
        endPoint: AppConstants.kRegister,
        body: {
          'firstName': firstName,
          'lastName': lastName,
          'userName': userName,
          'phone': phone,
          'idCard': idCard,
          'image': image,
          'password': password,
          'password_confirmation': confirmPassword,
        },
        token: null,
      );
      return right('User Created Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      await apiService.post(
        endPoint: AppConstants.kLogout,
        body: null,
        token: Prefs.getString(AppConstants.kToken),
      );
      return right('Logged Out Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword({
    required String newPassword,
    required String confirmNewPassword,
  }) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> confermForgetPassword({
    required String code,
  }) {
    // TODO: implement confermForgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> forgetPassword({
    required String userName,
    required String phone,
  }) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}

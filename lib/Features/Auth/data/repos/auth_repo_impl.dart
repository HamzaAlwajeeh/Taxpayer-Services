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
    required String idCard,
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
          'first_name': firstName,
          'last_name': lastName,
          'user_name': userName,
          'phone': phone,
          'id_card': idCard,
          'image': await MultipartFile.fromFile(image.path),
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
  Future<Either<Failure, String>> forgetPassword({
    required String userName,
    required String phone,
  }) async {
    try {
      await apiService.post(
        endPoint: AppConstants.kForgotPassword,
        body: {
          'user_name': userName,
          'phone': phone,
        },
        token: null,
      );
      return right('تم إرسال رمز التحقق بنجاح');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> confermForgetPassword({
    required String code,
  }) async {
    try {
      await apiService.post(
        endPoint: AppConstants.kVerifyCode,
        body: {
          'code': code,
        },
        token: null,
      );
      return right('تم التحقق من الرمز بنجاح');
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
  }) async {
    try {
      await apiService.post(
        endPoint: AppConstants.kResetPassword,
        body: {
          'new_password': newPassword,
          'confirm_new_password': confirmNewPassword,
        },
        token: Prefs.getString(AppConstants.kToken),
      );
      return right('تم تغيير كلمة المرور بنجاح');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

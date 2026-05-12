import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/services/api_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class ProfileRepoImpl implements ProfileRepo {
  ApiService apiService;
  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> editProfile({
    required String? firstName,
    required String? lastName,
    required File? idCard,
    required String? phone,
    required File? image,
    required String? userName,
    required String? password,
    required String? confirmPassword,
  }) async {
    try {
      Map<String, dynamic> body = {
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'phone': phone,
        'idCard': idCard,
        'image': image,
        'password': password,
        'password_confirmation': confirmPassword,
      };

      body.removeWhere((key, value) => value == null || value == '');

      await apiService.put(
        endPoint: AppConstants.kUpdateProfile,
        body: body,
        token: Prefs.getString(AppConstants.kToken),
      );
      return right('User Updated Successfully');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

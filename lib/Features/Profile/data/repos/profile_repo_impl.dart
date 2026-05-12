import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/services/api_service.dart';

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
  }) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }
}

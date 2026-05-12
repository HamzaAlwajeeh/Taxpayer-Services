import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tax_payer/core/errors/failuar.dart';

abstract class ProfileRepo {
  Future<Either<Failure, String>> editProfile({
    required String? firstName,
    required String? lastName,
    required File? idCard,
    required String? phone,
    required File? image,
    required String? userName,
    required String? password,
    required String? confirmPassword,
  });
}

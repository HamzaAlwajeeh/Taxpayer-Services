import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/core/errors/failuar.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> login({
    required String userName,
    required String password,
  });

  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required String phone,
    required String idCard,
    required File image,
    required String userName,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, String>> forgetPassword({
    required String userName,
    required String phone,
  });

  Future<Either<Failure, String>> confermForgetPassword({required String code});

  Future<Either<Failure, String>> changePassword({
    required String newPassword,
    required String confirmNewPassword,
  });

  Future<Either<Failure, String>> logOut();
}

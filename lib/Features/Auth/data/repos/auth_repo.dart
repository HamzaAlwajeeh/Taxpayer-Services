import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tax_payer/Features/Auth/data/models/reset_password.dart';
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
    required File idCard,
    required File? image,
    required String userName,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, ResetPassword>> resetPasswordRequest({
    required String userName,
  });

  Future<Either<Failure, String>> verifyResetPasswordCode({
    required int userId,
    required int code,
  });

  Future<Either<Failure, String>> resetPassword({
    required int userId,
    required int code,
    required String newPassword,
    required String confirmNewPassword,
  });

  Future<Either<Failure, String>> logOut();
}

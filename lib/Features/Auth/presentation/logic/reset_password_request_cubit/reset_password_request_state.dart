import 'package:tax_payer/Features/Auth/data/models/reset_password.dart';

abstract class ResetPasswordRequestState {}

final class ResetPasswordRequestInitial extends ResetPasswordRequestState {}

final class ResetPasswordRequestLoading extends ResetPasswordRequestState {}

final class ResetPasswordRequestFailure extends ResetPasswordRequestState {
  final String errorMessage;
  final String? errorKey;

  ResetPasswordRequestFailure({required this.errorMessage, this.errorKey});
}

final class ResetPasswordRequestSuccess extends ResetPasswordRequestState {
  final ResetPassword resetPassword;

  ResetPasswordRequestSuccess({required this.resetPassword});
}

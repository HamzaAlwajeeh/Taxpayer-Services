abstract class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;
  final String? errorKey;

  ForgotPasswordFailure({required this.errorMessage, this.errorKey});
}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;

  ForgotPasswordSuccess({required this.message});
}
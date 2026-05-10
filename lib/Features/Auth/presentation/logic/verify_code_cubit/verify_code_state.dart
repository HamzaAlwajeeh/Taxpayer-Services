abstract class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

final class VerifyCodeLoading extends VerifyCodeState {}

final class VerifyCodeFailure extends VerifyCodeState {
  final String errorMessage;
  final String? errorKey;

  VerifyCodeFailure({required this.errorMessage, this.errorKey});
}

final class VerifyCodeSuccess extends VerifyCodeState {
  final String message;

  VerifyCodeSuccess({required this.message});
}
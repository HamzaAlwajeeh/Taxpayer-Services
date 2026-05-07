abstract class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String errorMessage;

  LogoutFailure({required this.errorMessage});
}

final class LogoutSuccess extends LogoutState {
  final String message;

  LogoutSuccess({required this.message});
}

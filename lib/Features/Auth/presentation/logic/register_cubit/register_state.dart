abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}

final class RegisterSuccess extends RegisterState {
  final String message;

  RegisterSuccess({required this.message});
}

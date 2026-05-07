import 'package:tax_payer/Features/Auth/data/models/user/user.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});
}

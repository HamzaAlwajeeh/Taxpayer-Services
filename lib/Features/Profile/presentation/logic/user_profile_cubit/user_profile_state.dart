import 'package:tax_payer/Features/Auth/data/models/user/user.dart';

abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  final User user;
  UserProfileSuccess({required this.user});
}

class UserProfileFailure extends UserProfileState {
  final String errorMessage;
  UserProfileFailure({required this.errorMessage});
}

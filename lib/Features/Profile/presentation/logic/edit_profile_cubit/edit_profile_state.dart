abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final String message;
  EditProfileSuccess({required this.message});
}

class EditProfileFailure extends EditProfileState {
  final String message;
  EditProfileFailure({required this.message});
}

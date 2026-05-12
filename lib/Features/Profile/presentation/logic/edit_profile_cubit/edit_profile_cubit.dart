import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/edit_profile_cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileRepo profileRepo;

  EditProfileCubit(this.profileRepo) : super(EditProfileInitial());

  Future<void> editProfile({
    required String? firstName,
    required String? lastName,
    required String? phone,
    required String? userName,
    required File? image,
    required File? idCard,
    required String? password,
    required String? confirmPassword,
  }) async {
    emit(EditProfileLoading());
    final result = await profileRepo.editProfile(
      firstName: firstName,
      lastName: lastName,
      idCard: idCard ,
      phone: phone,
      image: image,
      userName: userName,
      password: password,
      confirmPassword: confirmPassword,
    );

    result.fold(
      (failure) => emit(EditProfileFailure(message: failure.errorMessage)),
      (success) => emit(EditProfileSuccess(message: success)),
    );
  }
}

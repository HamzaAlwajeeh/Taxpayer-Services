import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/models/user/user.dart';
import 'package:tax_payer/Features/Profile/data/repos/profile.repo.dart';
import 'package:tax_payer/Features/Profile/presentation/logic/user_profile_cubit/user_profile_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final ProfileRepo profileRepo;
  User? currentUser;

  UserProfileCubit(this.profileRepo) : super(UserProfileInitial());

  Future<void> getUserProfile() async {
    emit(UserProfileLoading());
    final result = await profileRepo.getUserProfile();

    result.fold(
      (failure) {
        print('==== UserProfileFailure ====');
        print(failure.errorMessage);
        emit(UserProfileFailure(errorMessage: failure.errorMessage));
      },
      (user) {
        currentUser = user;
        Prefs.setUser(AppConstants.kCurrentUser, user);
        emit(UserProfileSuccess(user: user));
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo authRepo;
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInitial());

  Future<void> changePassword({
    required int userId,
    required int code,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(
      userId: userId,
      code: code,
      newPassword: newPassword,
      confirmNewPassword: confirmNewPassword,
    );
    result.fold(
      (failure) => emit(
        ResetPasswordFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (message) => emit(ResetPasswordSuccess(message: message)),
    );
  }
}

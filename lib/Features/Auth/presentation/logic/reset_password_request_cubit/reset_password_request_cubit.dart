import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/reset_password_request_cubit/reset_password_request_state.dart';

class ResetPasswordRequestCubit extends Cubit<ResetPasswordRequestState> {
  final AuthRepo authRepo;
  int userId = 0;
  ResetPasswordRequestCubit(this.authRepo)
    : super(ResetPasswordRequestInitial());

  Future<void> resetPasswordRequest({required String userName}) async {
    emit(ResetPasswordRequestLoading());
    var result = await authRepo.resetPasswordRequest(userName: userName);
    result.fold(
      (failure) => emit(
        ResetPasswordRequestFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (resetPassword) {
        userId = resetPassword.userId;
        emit(ResetPasswordRequestSuccess(resetPassword: resetPassword));
      },
    );
  }
}

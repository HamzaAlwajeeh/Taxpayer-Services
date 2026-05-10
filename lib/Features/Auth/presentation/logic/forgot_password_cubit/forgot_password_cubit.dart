import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/forgot_password_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepo authRepo;
  ForgotPasswordCubit(this.authRepo) : super(ForgotPasswordInitial());

  Future<void> forgetPassword({
    required String userName,
    required String phone,
  }) async {
    emit(ForgotPasswordLoading());
    var result = await authRepo.forgetPassword(userName: userName, phone: phone);
    result.fold(
      (failure) => emit(
        ForgotPasswordFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (message) => emit(ForgotPasswordSuccess(message: message)),
    );
  }
}
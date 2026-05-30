import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/verify_code_cubit/verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final AuthRepo authRepo;
  VerifyCodeCubit(this.authRepo) : super(VerifyCodeInitial());

  Future<void> verifyCode({required int userId, required int code}) async {
    emit(VerifyCodeLoading());
    var result = await authRepo.verifyResetPasswordCode(
      userId: userId,
      code: code,
    );
    result.fold(
      (failure) => emit(
        VerifyCodeFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (message) => emit(VerifyCodeSuccess(message: message)),
    );
  }
}

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/Auth/data/repos/auth_repo.dart';
import 'package:tax_payer/Features/Auth/presentation/logic/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  Future<void> register({
    required String firstName,
    required String lastName,
    required String phone,
    required File idCard,
    required File image,
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoading());
    var result = await authRepo.register(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      idCard: idCard,
      image: image,
      userName: userName,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failure) => emit(
        RegisterFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (message) => emit(RegisterSuccess(message: message)),
    );
  }
}

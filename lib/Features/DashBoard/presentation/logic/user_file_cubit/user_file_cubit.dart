import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/Features/DashBoard/data/repos/user_file_repo.dart';
import 'package:tax_payer/Features/DashBoard/presentation/logic/user_file_cubit/user_file_state.dart';

class UserFileCubit extends Cubit<UserFileState> {
  final UserFileRepo userFileRepo;
  List<File> filesList = [];
  UserFileCubit(this.userFileRepo) : super(UserFileInitial());

  Future<void> getUserFiles() async {
    emit(UserFileLoading());
    var result = await userFileRepo.getUserFiles();
    result.fold(
      (failure) => emit(
        UserFileFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (files) {
        filesList = files;
        emit(UserFileSuccess(files: files));
      },
    );
  }

  Future<void> getUserFileById({required int id}) async {
    emit(UserFileLoading());
    var result = await userFileRepo.getUserFileById(id: id);
    result.fold(
      (failure) => emit(
        UserFileFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (userFile) => emit(UserFileSingleSuccess(userFile: userFile)),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/DashBoard/data/repos/user_file_repo.dart';
import 'package:tax_payer/Features/Home/presentation/logic/user_file_cubit/user_file_state.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class UserFileCubit extends Cubit<UserFileState> {
  final UserFileRepo userFileRepo;

  List<File> filesList = [];
  UserFile userFile = UserFile();

  UserFileCubit(this.userFileRepo) : super(UserFileInitial());

  Future<void> getUserFiles() async {
    emit(UserFileLoading());

    final result = await userFileRepo.getUserFiles();

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

    final result = await userFileRepo.getUserFileById(id: id);

    result.fold(
      (failure) => emit(
        UserFileFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (userFile) {
        this.userFile = userFile;

        emit(UserFileSingleSuccess(userFile: userFile));
      },
    );
  }

  Future<void> initializeCurrentFile() async {
    emit(UserFileLoading());

    final filesResult = await userFileRepo.getUserFiles();

    await filesResult.fold(
      (failure) async {
        emit(
          UserFileFailure(
            errorMessage: failure.errorMessage,
            errorKey: failure.errorKey,
          ),
        );
      },
      (files) async {
        filesList = files;

        if (files.isEmpty) {
          Prefs.setInt(AppConstants.kCurrentFile, 0);

          emit(UserFileSuccess(files: files));
          return;
        }

        final currentFileId = Prefs.getInt(AppConstants.kCurrentFile);

        final exists = files.any((file) => file.id == currentFileId);

        final selectedFileId = exists ? currentFileId : files.first.id!;

        Prefs.setInt(AppConstants.kCurrentFile, selectedFileId);

        final fileResult = await userFileRepo.getUserFileById(
          id: selectedFileId,
        );

        fileResult.fold(
          (failure) {
            emit(
              UserFileFailure(
                errorMessage: failure.errorMessage,
                errorKey: failure.errorKey,
              ),
            );
          },
          (userFile) {
            this.userFile = userFile;

            emit(UserFileSingleSuccess(userFile: userFile));
          },
        );
      },
    );
  }
}

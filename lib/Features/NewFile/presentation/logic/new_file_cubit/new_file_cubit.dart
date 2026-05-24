import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/Features/NewFile/presentation/logic/new_file_cubit/new_file_state.dart';

class NewFileCubit extends Cubit<NewFileState> {
  final NewFileRepo newFileRepo;

  NewFileCubit(this.newFileRepo) : super(NewFileInitial());

  Future<void> createNewFile({
    required String tradeName,
    required File commercialRecord,
    required File activityLicense,
    required File tradePicture,
    required File insuranceCard,
    required File propertyDocPicture,
    File? articlesOfIncorporation,
    File? governmentLicense,
    File? partinersIDCards,
    File? bylawsCopy,
    required String fileType,
  }) async {
    emit(NewFileLoading());
    var result = await newFileRepo.createNewFile(
      tradeName: tradeName,
      commercialRecord: commercialRecord,
      activityLicense: activityLicense,
      tradePicture: tradePicture,
      insuranceCard: insuranceCard,
      propertyDocPicture: propertyDocPicture,
      articlesOfIncorporation: articlesOfIncorporation,
      governmentLicense: governmentLicense,
      partinersIDCards: partinersIDCards,
      bylawsCopy: bylawsCopy,
      fileType: fileType,
    );
    result.fold(
      (failure) => emit(
        NewFileFailure(
          errorMessage: failure.errorMessage,
          errorKey: failure.errorKey,
        ),
      ),
      (successMessage) => emit(NewFileSuccess(message: successMessage)),
    );
  }
}

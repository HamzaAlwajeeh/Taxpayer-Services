import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tax_payer/Features/NewFile/data/repos/new_file_repo.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/services/api_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class NewFileRepoImpl implements NewFileRepo {
  final ApiService apiService;

  NewFileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, String>> createNewFile({
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
    try {
      final Map<String, dynamic> body = {
        'tradeName': tradeName,
        'commercialRecord': commercialRecord,
        'activityLicense': activityLicense,
        'tradePicture': tradePicture,
        'insuranceCard': insuranceCard,
        'propertyDocPicture': propertyDocPicture,
        'articlesOfIncorporation': articlesOfIncorporation,
        'governmentLicense': governmentLicense,
        'partinersIDCards': partinersIDCards,
        'bylawsCopy': bylawsCopy,
        'fileType': fileType,
      };

      final response = await apiService.post(
        endPoint: AppConstants.kCreateNewFile,
        body: body,
        token: Prefs.getString(AppConstants.kToken),
      );

      return right(response['message'] ?? 'تم إنشاء الملف بنجاح');
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

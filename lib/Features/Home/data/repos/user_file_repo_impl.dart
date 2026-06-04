import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tax_payer/Features/Home/data/models/files/file.dart';
import 'package:tax_payer/Features/Home/data/models/user_file/user_file.dart';
import 'package:tax_payer/Features/Home/data/repos/user_file_repo.dart';
import 'package:tax_payer/core/constants/constants.dart';
import 'package:tax_payer/core/errors/failuar.dart';
import 'package:tax_payer/core/services/api_service.dart';
import 'package:tax_payer/core/services/shared_pref_singleton.dart';

class UserFileRepoImpl implements UserFileRepo {
  ApiService apiService;
  UserFileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<File>>> getUserFiles() async {
    try {
      var data = await apiService.get(
        body: null,
        endPoint: AppConstants.kGetUserFiles,
        token: Prefs.getString(AppConstants.kToken),
      );

      List<File> files =
          (data['data'] as List<dynamic>).map((item) {
            Map<String, dynamic> fileItem =
                item['file'] as Map<String, dynamic>;
            return File.fromJson(fileItem);
          }).toList();

      return Right(files);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserFile>> getUserFileById({required int id}) async {
    try {
      var data = await apiService.get(
        body: null,
        endPoint: '${AppConstants.kGetUserFileById}/$id',
        token: Prefs.getString(AppConstants.kToken),
      );

      // استخراج البيانات من المصفوفة واستخدام العنصر الأول
      List<dynamic> dataList = data['data'] as List<dynamic>;
      if (dataList.isNotEmpty) {
        Map<String, dynamic> userData = dataList[0] as Map<String, dynamic>;
        UserFile userFile = UserFile.fromJson(userData);
        return Right(userFile);
      } else {
        throw Exception('No data found');
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> hasRequestPending() async {
    try {
      var data = await apiService.get(
        body: null,
        endPoint: AppConstants.kHasRequest,
        token: Prefs.getString(AppConstants.kToken),
      );

      bool hasRequest = data['data']['exists'] as bool;
      return Right(hasRequest);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

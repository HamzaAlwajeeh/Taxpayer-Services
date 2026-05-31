import 'package:dartz/dartz.dart';
import 'package:tax_payer/Features/DashBoard/data/models/files/file.dart';
import 'package:tax_payer/Features/DashBoard/data/models/user_file/user_file.dart';
import 'package:tax_payer/core/errors/failuar.dart';

abstract class UserFileRepo {
  Future<Either<Failure, List<File>>> getUserFiles();

  Future<Either<Failure, UserFile>> getUserFileById({required int id});
}

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tax_payer/core/errors/failuar.dart';

abstract class NewFileRepo {
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
  });
}

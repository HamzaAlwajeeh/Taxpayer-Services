import 'package:tax_payer/Features/Home/data/models/files/file.dart';
import 'package:tax_payer/Features/Home/data/models/user_file/user_file.dart';

abstract class UserFileState {}

final class UserFileInitial extends UserFileState {}

final class UserFileLoading extends UserFileState {}

final class UserFileFailure extends UserFileState {
  final String errorMessage;
  final String? errorKey;

  UserFileFailure({required this.errorMessage, this.errorKey});
}

final class UserFileSuccess extends UserFileState {
  final List<File> files;

  UserFileSuccess({required this.files});
}

final class UserFileSingleSuccess extends UserFileState {
  final UserFile userFile;

  UserFileSingleSuccess({required this.userFile});
}

final class HasRequestPendingLoading extends UserFileState {}

final class HasRequestPendingFailure extends UserFileState {
  final String errorMessage;
  final String? errorKey;

  HasRequestPendingFailure({required this.errorMessage, this.errorKey});
}

final class HasRequestPendingSuccess extends UserFileState {
  final bool hasRequestPending;

  HasRequestPendingSuccess({required this.hasRequestPending});
}

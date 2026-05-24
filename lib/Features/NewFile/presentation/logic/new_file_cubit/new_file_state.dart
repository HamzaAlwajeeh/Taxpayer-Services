abstract class NewFileState {}

final class NewFileInitial extends NewFileState {}

final class NewFileLoading extends NewFileState {}

final class NewFileFailure extends NewFileState {
  final String errorMessage;
  final String? errorKey;

  NewFileFailure({required this.errorMessage, this.errorKey});
}

final class NewFileSuccess extends NewFileState {
  final String message;

  NewFileSuccess({required this.message});
}

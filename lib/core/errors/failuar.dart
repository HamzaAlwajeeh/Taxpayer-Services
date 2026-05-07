import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:tax_payer/generated/l10n.dart';

abstract class Failure {
  final String errorMessage;
  final String? errorKey;

  Failure({required this.errorMessage, this.errorKey});

  static String localizedMessage(
    BuildContext context, {
    required String errorMessage,
    String? errorKey,
  }) {
    final translations = S.of(context);

    return switch (errorKey) {
      'ConnectionTimeout' => translations.ConnectionTimeout,
      'SendTimeout' => translations.SendTimeout,
      'ReceiveTimeout' => translations.ReceiveTimeout,
      'BadCertificate' => translations.BadCertificate,
      'RequestCanceled' => translations.RequestCanceled,
      'NoInternetConnection' => translations.NoInternetConnection,
      'UnknownError' => translations.UnknownError,
      'UnauthorizedRequest' => translations.UnauthorizedRequest,
      'MethodNotFound' => translations.MethodNotFound,
      'InternalServerError' => translations.InternalServerError,
      'OopsError' => translations.OopsError,
      _ => errorMessage,
    };
  }
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage, super.errorKey});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: 'Connection timeout with ApiServer',
          errorKey: 'ConnectionTimeout',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: 'Send timeout with ApiServer',
          errorKey: 'SendTimeout',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: 'Receive timeout with ApiServer',
          errorKey: 'ReceiveTimeout',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage: 'Bad certificate',
          errorKey: 'BadCertificate',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage: 'Request to ApiServer was canceled',
          errorKey: 'RequestCanceled',
        );

      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage: 'No Internet connection',
          errorKey: 'NoInternetConnection',
        );

      case DioExceptionType.unknown:
        return ServerFailure(
          errorMessage:
              'Unknown error, something went wrong , please try again later',
          errorKey: 'UnknownError',
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // معالجة Laravel Validation Errors
    if (response is Map && response['errors'] != null) {
      final errors = StringBuffer();

      response['errors'].forEach((key, value) {
        if (value is List) {
          for (var msg in value) {
            errors.writeln(msg);
          }
        } else {
          errors.writeln(value.toString());
        }
      });

      return ServerFailure(errorMessage: errors.toString());
    }

    if (response is Map) {
      final backendMessage = response['error'] ?? response['message'];
      if (backendMessage != null) {
        return ServerFailure(errorMessage: backendMessage.toString());
      }
    }

    // Errors without a backend message
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        errorMessage: 'Unauthorized request',
        errorKey: 'UnauthorizedRequest',
      );
    }

    if (statusCode == 404) {
      return ServerFailure(
        errorMessage: 'Method Not Found , please try again',
        errorKey: 'MethodNotFound',
      );
    }

    if (statusCode == 500) {
      return ServerFailure(
        errorMessage: 'Internal Server Error , please try again later',
        errorKey: 'InternalServerError',
      );
    }

    return ServerFailure(
      errorMessage: 'Oops, There is an error , please try again later',
      errorKey: 'OopsError',
    );
  }
}

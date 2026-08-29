import 'package:dio/dio.dart';

import 'error_model.dart';


abstract class Failure {
  final String message;
  Failure(this.message);
}


class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkTimeoutFailure(
            'Connection timed out. Please check your internet and try again.');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        final message = dioException.message?.toLowerCase() ?? '';
        if (message.contains('socketexception') || 
            message.contains('failed host lookup') ||
            message.contains('network is unreachable')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected error, please try again.');
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFailure.fromResponse(int? status, dynamic response) {
    if (status == null) return ServerFailure('No status code received.');

    if ([400, 401, 403, 409, 422].contains(status)) {
      try {
        if (response is Map<String, dynamic>) {
          // Check for direct error field first
          if (response['error'] != null) {
            return ServerFailure(response['error'].toString());
          }

          final errorModel = ErrorModel.fromJson(response);

          if (errorModel.errors != null && errorModel.errors!.isNotEmpty) {
            final firstError = errorModel.errors!.entries.first.value.first;
            return ServerFailure(firstError);
          }

          if (errorModel.error != null && errorModel.error!.isNotEmpty) {
            return ServerFailure(errorModel.error!);
          }

          if (errorModel.message != null && errorModel.message!.isNotEmpty) {
            return ServerFailure(errorModel.message!);
          }
        }
      } catch (_) {
        return ServerFailure('Error parsing server response.');
      }

      return ServerFailure('Validation or client error.');
    }

    if (status == 404) {
      try {
        if (response is Map<String, dynamic>) {
          // Check for message field first (e.g., "This student is not in any groups.")
          if (response['message'] != null) {
            return ServerFailure(response['message'].toString());
          }
          // Check for error field
          if (response['error'] != null) {
            return ServerFailure(response['error'].toString());
          }
        }
      } catch (_) {
        // Fall through to default message
      }
      return ServerFailure('Resource not found.');
    }
    if (status == 500) return ServerFailure('Internal server error.');
    if (status == 302) return ServerFailure('Request redirected unexpectedly.');

    return ServerFailure('Oops! Something went wrong.');
  }
}

class NetworkTimeoutFailure extends ServerFailure {
  NetworkTimeoutFailure(super.message);
}
import 'package:dio/dio.dart';

abstract class ApiErrors {
  final String errorMessage;
  ApiErrors(this.errorMessage);
}

class ServerFailure extends ApiErrors {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Timeout error');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout error');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recive Timeout error');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode,
          dioException.response!.data,
          
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request cancled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Opps There was an Error, Please try again');
      case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  factory ServerFailure.fromResponse(int? status, dynamic response) {
    try {
      // Handle common status codes with structured JSON
      if (status == 400 || status == 401 || status == 403 || status == 422 || status == 409) {
        if (response is Map && response['message'] != null) {
          final msg = response['message'];
          if (msg is Map && msg.containsKey('error')) return ServerFailure(msg['error']);
          if (msg is String) return ServerFailure(msg);
          return ServerFailure('Unexpected error message format.');
        }

        if (response is String) return ServerFailure(response);
        return ServerFailure('Invalid error format from server.');
      }

      // Handle redirection (302) and HTML responses
      if (status == 302 || (response is String && response.contains('<html'))) {
        return ServerFailure('Request was redirected unexpectedly.');
        
      }

      if (status == 404) return ServerFailure('The resource was not found.');
      if (status == 500) return ServerFailure('Internal server error.');

      return ServerFailure('Oops! Something went wrong.');
    } catch (e) {
      return ServerFailure('Error parsing server response.');
    }
  }

}
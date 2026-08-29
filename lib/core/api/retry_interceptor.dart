import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';

/// Retry interceptor that only retries idempotent HTTP methods (GET, HEAD)
/// with exponential backoff to avoid duplicate write operations and reduce
/// backend load. Retries are silent to avoid noisy UX.
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration baseDelay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.baseDelay = const Duration(milliseconds: 500),
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    final extra = err.requestOptions.extra;
    final retryCount = extra['retry_count'] as int? ?? 0;

    // Only retry if:
    // 1. The error is retryable (network/timeout issues)
    // 2. The HTTP method is idempotent (safe to retry)
    // 3. We haven't exceeded max retries
    if (_shouldRetry(err) &&
        _isIdempotentMethod(err.requestOptions.method) &&
        retryCount < maxRetries) {
      final newRetryCount = retryCount + 1;
      extra['retry_count'] = newRetryCount;

      // Calculate exponential backoff with jitter
      // Formula: baseDelay * (2 ^ retryCount) + random jitter
      final exponentialDelay = baseDelay * pow(2, retryCount);
      final jitter = Duration(
        milliseconds: Random().nextInt(200),
      ); // 0-200ms jitter
      final delay = exponentialDelay + jitter;

      await Future.delayed(delay);

      try {
        final response = await dio.request(
          err.requestOptions.path,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: extra,
          ),
        );
        return handler.resolve(response);
      } catch (e) {
        // If retry also fails, continue with error handling
        if (e is DioException) {
          return super.onError(e, handler);
        }
        return super.onError(err, handler);
      }
    }

    return super.onError(err, handler);
  }

  /// Checks if the error is retryable (network/timeout issues, not server errors)
  bool _shouldRetry(DioException err) {
    // Don't retry on HTTP errors (4xx, 5xx) - these are likely not transient
    if (err.response != null) {
      return false;
    }

    // Only retry on network/timeout errors
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError;
  }

  /// Checks if the HTTP method is idempotent (safe to retry)
  /// Only GET and HEAD are truly idempotent and safe to retry
  bool _isIdempotentMethod(String method) {
    final upperMethod = method.toUpperCase();
    return upperMethod == 'GET' || upperMethod == 'HEAD';
  }
}
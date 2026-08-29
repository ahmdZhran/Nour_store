import 'package:dio/dio.dart';
import 'package:nour_store/core/languages/locale_cubit.dart';
import 'package:nour_store/core/local/shared_pref_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Use cached token - no I/O operation, much faster
    // final token = TokenCache.getToken();
    options.headers['Accept'] = 'application/json';
    // options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Clear token cache first
      // await TokenCache.clearToken();
      await SharedPrefHelper.clearAllSecuredData();
      // Preserve language preference when clearing data on 401
      await SharedPrefHelper.clearAllDataExcept([LocaleCubit.languageKey]);

      // navigatorKey.currentState?.pushNamedAndRemoveUntil(
      //   Routes.login,
      //   (route) => false,
      // );
    }
    super.onError(err, handler);
  }
}

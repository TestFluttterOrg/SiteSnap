import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.connectTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
    options.contentType = 'application/json';
    options.headers["CLIENT_ID"] = "rgbexam";
    super.onRequest(options, handler);
  }
}

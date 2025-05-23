import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiClient {
  static final Dio _dio = _createDio();

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.quran.gading.dev',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add logging interceptor
    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );

    // For development only - fix SSL certificate issues
    // IMPORTANT: Remove this in production!
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (
      client,
    ) {
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    return dio;
  }

  static Dio get dio => _dio;
}

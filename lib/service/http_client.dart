import 'package:dio/dio.dart';

class CustomHttpClient {
  late Dio _client;

  CustomHttpClient() {
    _client = Dio(
      BaseOptions(
        baseUrl: "https://192.168.0.217:44311/api",
        sendTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        followRedirects: false,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> get(
    String url, {
    Map<String, String>? queryParms = const {},
  }) async => await _client.get(url, queryParameters: queryParms);

  Future<Response> post(String url, {dynamic payload}) async =>
      await _client.post(url, data: payload);
}

import 'package:dio/dio.dart';

class HttpClient {
  late Dio _client;

  HttpClient() {
    _client = Dio(
      BaseOptions(
        baseUrl: "https://localhost:44319/",
        sendTimeout: const Duration(milliseconds: 60000),
        receiveTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        followRedirects: false,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? queryParms = const {},
  }) async {
    var response = await _client.get(url, data: queryParms);
    return response.data;
  }

  Future<Map<String, dynamic>> post(String url, {dynamic payload}) async {
    var response = await _client.post(url, data: payload);
    return response.data;
  }
}

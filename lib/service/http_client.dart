import 'package:boardgame_collector/service/shared/entity.dart';
import 'package:boardgame_collector/service/shared/paged_result.dart';
import 'package:boardgame_collector/util/map_extension.dart';
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

  Future<PagedResult<TEntity>> get<TEntity extends Entity>(
    String url,
    Function parseFunc, {
    Map<String, String>? queryParms = const {},
  }) async {
    var response = await _client.get(url, queryParameters: queryParms);
    return (response.data as Map<String, dynamic>).parseJsonList(parseFunc);
  }

  Future<Map<String, dynamic>> post(String url, {dynamic payload}) async {
    var response = await _client.post(url, data: payload);
    return (response.data as Map<String, dynamic>);
  }
}

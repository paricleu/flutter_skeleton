import 'package:dio/dio.dart';
import 'package:flutter_skeleton/src/data/remote/api_result.dart';
import 'package:flutter_skeleton/src/data/remote/network_exceptions.dart';
import 'package:flutter_skeleton/src/data/remote/requests/cats_request.dart';
import 'package:flutter_skeleton/src/data/remote/responses/cats_response.dart';
import 'package:flutter_skeleton/src/data/remote/rest_client.dart';

const String testApiUrl = 'https://api.thecatapi.com/v1/';
const String liveApiUrl = 'https://api.thecatapi.com/v1/';

class RemoteRepository {
  final Dio _dio = Dio();
  final String apiKey;
  late RestClient _restClient;

  RemoteRepository({required this.apiKey, bool isDev = false}) {
    _dio.options.baseUrl = isDev ? testApiUrl : liveApiUrl;
    _dio.options.headers["x-api-key"] = apiKey;

    if (isDev) {
      // Example for basic auth
      _dio.options.headers['authorization'] = 'Basic cXVpeDptaW50MjIyMg==';

      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );

      _restClient = RestClient(_dio, baseUrl: isDev ? testApiUrl : liveApiUrl);
    }
  }

  void addSessionHeader(String sessionToken) {
    _dio.options.headers['session-token'] = sessionToken;
  }

  void removeSessionHeader() {
    _dio.options.headers.remove('session-token');
  }

  Future<ApiResult<List<CatsResponse>>> getCatList([
    int? limit,
    int? page,
  ]) async {
    final CatsRequest request = CatsRequest(limit: limit, page: page);
    try {
      final response = await _restClient.getCats(request);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(error: NetworkException.fromError(e));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_skeleton/src/data/remote/requests/cats_request.dart';
import 'package:flutter_skeleton/src/data/remote/responses/cats_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/images/search')
  Future<List<CatsResponse>> getCats(@Queries() CatsRequest request);
}

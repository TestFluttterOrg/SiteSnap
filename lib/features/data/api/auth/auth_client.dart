import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sitesnap/core/constants/app_constants.dart';
import 'package:sitesnap/features/domain/entity/login/login_api_result_entity.dart';


part 'auth_client.g.dart';

@RestApi(baseUrl: AppConstants.apiBaseUrl)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('/api/v1/login')
  Future<HttpResponse<LoginApiResultEntity>> login(@Body() data);
}
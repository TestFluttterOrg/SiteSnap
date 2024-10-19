import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sitesnap/core/constants/app_constants.dart';
import 'package:sitesnap/features/domain/entity/social/social_entity.dart';


part 'social_client.g.dart';

@RestApi(baseUrl: AppConstants.apiBaseUrl)
abstract class SocialClient {
  factory SocialClient(Dio dio, {String baseUrl}) = _SocialClient;

  @GET('/api/v1/socials')
  Future<HttpResponse<List<SocialEntity>>> getSocials();
}
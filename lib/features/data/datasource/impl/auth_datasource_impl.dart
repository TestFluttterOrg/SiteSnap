import 'package:dio/dio.dart';
import 'package:sitesnap/core/constants/app_strings.dart';
import 'package:sitesnap/features/data/api/auth/auth_client.dart';
import 'package:sitesnap/features/data/datasource/auth_datasource.dart';
import 'package:sitesnap/features/domain/entity/login/login_api_result_entity.dart';
import 'package:sitesnap/features/domain/entity/login/login_payload_entity.dart';
import 'package:sitesnap/features/domain/model/result_model.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final AuthClient client;

  AuthDataSourceImpl({required this.client});

  @override
  Future<ResultModel<LoginApiResultEntity>> login(LoginPayloadEntity data) async {
    try {
      FormData formData = FormData.fromMap(data.toJson());
      final result = await client.login(formData);
      if (result.data.loginStatus == "success") {
        return ResultModel(
          isSuccess: true,
          data: result.data,
        );
      }
    } on DioException catch (_) {
      // if (e.response?.data != null) {
      //   final result = LoginApiResultEntity.fromJson(e.response!.data);
      //   if (result.error != null) {
      //     return ResultModel(
      //       isSuccess: false,
      //       message: result.error!,
      //     );
      //   }
      // }
    } catch (_) {}
    return const ResultModel(
      isSuccess: false,
      message: AppStrings.messageLoginFailed,
    );
  }
}

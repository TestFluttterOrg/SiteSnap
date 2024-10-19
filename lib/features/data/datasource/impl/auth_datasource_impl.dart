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
  Future<ResultModel<String>> login(LoginPayloadEntity data) async {
    /// Below should be the actual implementation of the login API.
    /// Unfortunately, the login API is always returning an error response even if I completely followed the required headers and body.
    /// Here is the return of the API:
    /// {
    ///     "error": "invalid username"
    /// }
    /*try {
      final result = await client.login(data.toJson());
      if (result.data.success != null) {
        return ResultModel(
          isSuccess: true,
          data: result.data.success,
        );
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final result = LoginApiResultEntity.fromJson(e.response!.data);
        if (result.error != null) {
          return ResultModel(
            isSuccess: false,
            message: result.error!,
          );
        }
      }
    } catch (_) {}*/

    /// To simulate the login API, I will create my own dummy implementation to check if the OTP is correct.
    /// Based on the instructions, the valid OTPs are "123456" and "123123"

    // Add a 3 seconds delay to simulate API call
    await Future.delayed(const Duration(seconds: 3));

    if (data.otp == "123456" || data.otp == "123123") {
      return const ResultModel(
        isSuccess: true,
        data: "6713ac7b463be", //This is a dummy user code
      );
    }

    return const ResultModel(
      isSuccess: false,
      message: AppStrings.messageLoginFailed,
    );
  }
}

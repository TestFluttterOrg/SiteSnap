import 'package:sitesnap/features/domain/entity/login/login_api_result_entity.dart';
import 'package:sitesnap/features/domain/entity/login/login_payload_entity.dart';
import 'package:sitesnap/features/domain/model/result_model.dart';

abstract class AuthDataSource {
  Future<ResultModel<LoginApiResultEntity>> login(LoginPayloadEntity data);
}

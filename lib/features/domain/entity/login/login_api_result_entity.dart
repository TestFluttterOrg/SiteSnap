import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_api_result_entity.g.dart';

part 'login_api_result_entity.freezed.dart';

@freezed
class LoginApiResultEntity with _$LoginApiResultEntity {
  factory LoginApiResultEntity({
    String? error,
    String? success,
  }) = _LoginApiResultEntity;

  factory LoginApiResultEntity.fromJson(Map<String, dynamic> json) => _$LoginApiResultEntityFromJson(json);
}

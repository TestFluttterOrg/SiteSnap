import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_payload_entity.g.dart';

part 'login_payload_entity.freezed.dart';

@freezed
class LoginPayloadEntity with _$LoginPayloadEntity {
  factory LoginPayloadEntity({
    String? userName,
    String? otp,
  }) = _LoginPayloadEntity;

  factory LoginPayloadEntity.fromJson(Map<String, dynamic> json) => _$LoginPayloadEntityFromJson(json);
}

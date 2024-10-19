import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_entity.g.dart';

part 'social_entity.freezed.dart';

@freezed
class SocialEntity with _$SocialEntity {
  factory SocialEntity({
    String? name,
    String? history,
    String? iconUrl,
    String? imgUrl,
    String? webUrl,
  }) = _SocialEntity;

  factory SocialEntity.fromJson(Map<String, dynamic> json) => _$SocialEntityFromJson(json);
}

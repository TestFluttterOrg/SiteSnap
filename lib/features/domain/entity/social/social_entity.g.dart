// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialEntityImpl _$$SocialEntityImplFromJson(Map<String, dynamic> json) =>
    _$SocialEntityImpl(
      name: json['name'] as String?,
      history: json['history'] as String?,
      iconUrl: json['iconUrl'] as String?,
      imgUrl: json['imgUrl'] as String?,
      webUrl: json['webUrl'] as String?,
    );

Map<String, dynamic> _$$SocialEntityImplToJson(_$SocialEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'history': instance.history,
      'iconUrl': instance.iconUrl,
      'imgUrl': instance.imgUrl,
      'webUrl': instance.webUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_support_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiSupportEntity _$ApiSupportEntityFromJson(Map<String, dynamic> json) =>
    ApiSupportEntity(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ApiSupportEntityToJson(ApiSupportEntity instance) =>
    <String, dynamic>{
      if (instance.url case final value?) 'url': value,
      if (instance.text case final value?) 'text': value,
    };

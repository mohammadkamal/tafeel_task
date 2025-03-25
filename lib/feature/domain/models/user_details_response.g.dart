// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse(
      data: json['data'] == null
          ? null
          : UserDetailsEntity.fromJson(json['data'] as Map<String, dynamic>),
      support: json['support'] == null
          ? null
          : ApiSupportEntity.fromJson(json['support'] as Map<String, dynamic>),
    );

UserDetailsEntity _$UserDetailsEntityFromJson(Map<String, dynamic> json) =>
    UserDetailsEntity(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

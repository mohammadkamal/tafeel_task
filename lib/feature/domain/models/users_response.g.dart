// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      support: json['support'] == null
          ? null
          : ApiSupportEntity.fromJson(json['support'] as Map<String, dynamic>),
      page: (json['page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      totalPages: (json['total_pages'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UserEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

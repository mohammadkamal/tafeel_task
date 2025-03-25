import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/core/models/api_support_entity.dart';
import 'package:tafeel_task/core/models/pagination_response.dart';

part 'users_response.g.dart';

@JsonSerializable(createToJson: false)
class UsersResponse extends PaginationResponse {
  const UsersResponse({
    super.support,
    required super.page,
    required super.perPage,
    required super.total,
    required super.totalPages,
    this.data = const [],
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  final List<UserEntity> data;
}

@JsonSerializable(createToJson: false)
class UserEntity {
  const UserEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  Uri? get avatarUri => avatar == null ? null : Uri.tryParse(avatar!);

  String get fullName {
    if (firstName == null && lastName == null) return '';

    final firstValue = firstName == null ? '' : '$firstName ';
    final lastValue = lastName == null ? '' : lastName!;

    return firstValue + lastValue;
  }
}

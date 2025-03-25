import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/core/models/api_support_entity.dart';
import 'package:tafeel_task/core/models/base_response.dart';

part 'user_details_response.g.dart';

@JsonSerializable(createToJson: false)
class UserDetailsResponse extends BaseResponse {
  final UserDetailsEntity? data;

  const UserDetailsResponse({this.data, super.support});

  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class UserDetailsEntity {
  const UserDetailsEntity({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsEntityFromJson(json);

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

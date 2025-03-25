import 'package:json_annotation/json_annotation.dart';

part 'api_support_entity.g.dart';

@JsonSerializable()
class ApiSupportEntity {
  const ApiSupportEntity({this.url, this.text});

  factory ApiSupportEntity.fromJson(Map<String, dynamic> json) =>
      _$ApiSupportEntityFromJson(json);

  final String? url;
  final String? text;

  Map<String, dynamic> toJson() => _$ApiSupportEntityToJson(this);

  Uri? get uri => url == null ? null : Uri.tryParse(url!);
}

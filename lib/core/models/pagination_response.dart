import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/core/models/api_support_entity.dart';
import 'package:tafeel_task/core/models/base_response.dart';

part 'pagination_response.g.dart';

@JsonSerializable(createToJson: false)
class PaginationResponse extends BaseResponse {
  const PaginationResponse({
    super.support,
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginationResponseFromJson(json);

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
}

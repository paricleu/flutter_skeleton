import 'package:json_annotation/json_annotation.dart';

part 'cats_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CatsRequest {
  final String size;
  final int? limit;
  final int? page;
  final String order;

  CatsRequest({
    this.limit,
    this.order = 'RANDOM',
    this.size = 'small',
    this.page,
  });

  factory CatsRequest.fromJson(Map<String, dynamic> json) {
    return _$CatsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CatsRequestToJson(this);
}

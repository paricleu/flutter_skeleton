import 'package:json_annotation/json_annotation.dart';

part 'cats_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CatsResponse {
  final String id;
  @JsonKey(name: "url")
  final String imageUrl;

  CatsResponse(
    this.id,
    this.imageUrl,
  );

  factory CatsResponse.fromJson(Map<String, dynamic> json) {
    return _$CatsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CatsResponseToJson(this);
}

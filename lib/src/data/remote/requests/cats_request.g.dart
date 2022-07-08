// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatsRequest _$CatsRequestFromJson(Map<String, dynamic> json) => CatsRequest(
      limit: json['limit'] as int?,
      order: json['order'] as String? ?? "RANDOM",
      size: json['size'] as String? ?? "small",
      page: json['page'] as int?,
    );

Map<String, dynamic> _$CatsRequestToJson(CatsRequest instance) =>
    <String, dynamic>{
      'size': instance.size,
      'limit': instance.limit,
      'page': instance.page,
      'order': instance.order,
    };

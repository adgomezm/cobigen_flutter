// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResponseDto _$ListResponseDtoFromJson(Map<String, dynamic> json) {
  return ListResponseDto(
    (json['content'] as List)
        ?.map((e) => e == null
            ? null
            : ListContentResponseDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['pageable'] == null
        ? null
        : PageableDto.fromJson(json['pageable'] as Map<String, dynamic>),
    json['totalElements'] as int,
  );
}

Map<String, dynamic> _$ListResponseDtoToJson(ListResponseDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'pageable': instance.pageable,
      'totalElements': instance.totalElements,
    };

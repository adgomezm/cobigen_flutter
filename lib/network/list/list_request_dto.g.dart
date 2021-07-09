// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRequestDto _$ListRequestDtoFromJson(Map<String, dynamic> json) {
  return ListRequestDto(
    json['employeeId'] as String,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
    json['pageable'] == null
        ? null
        : PageableDto.fromJson(json['pageable'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListRequestDtoToJson(ListRequestDto instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'pageable': instance.pageable,
    };

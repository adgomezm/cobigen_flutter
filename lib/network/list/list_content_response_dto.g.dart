// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_content_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListContentResponseDto _$ListContentResponseDtoFromJson(
    Map<String, dynamic> json) {
  return ListContentResponseDto(
    json['modificationCounter'] as int,
    json['id'] as int,
    json['employeeId'] as int,
    json['name'] as String,
    json['surname'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$ListContentResponseDtoToJson(
        ListContentResponseDto instance) =>
    <String, dynamic>{
      'modificationCounter': instance.modificationCounter,
      'id': instance.id,
      'employeeId': instance.employeeId,
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
    };

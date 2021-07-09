import 'package:json_annotation/json_annotation.dart';
part 'list_content_response_dto.g.dart';

@JsonSerializable()
class ListContentResponseDto {
  final int modificationCounter;
  final int id;
  final int employeeId;
  final String name;
  final String surname;
  final String email;

  ListContentResponseDto(this.modificationCounter, this.id, this.employeeId,
      this.name, this.surname, this.email);

  factory ListContentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ListContentResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListContentResponseDtoToJson(this);
}

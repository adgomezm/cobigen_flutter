import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_request_dto.g.dart';

@JsonSerializable()
class ListRequestDto {
  final String employeeId;
  final String name;
  final String surname;
  final String email;
  final PageableDto pageable;

  ListRequestDto(
      this.employeeId, this.name, this.surname, this.email, this.pageable);

  factory ListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ListRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListRequestDtoToJson(this);
}

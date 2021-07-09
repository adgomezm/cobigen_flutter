import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:flutter_springboot/network/list/list_content_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'list_response_dto.g.dart';

@JsonSerializable()
class ListResponseDto {
  final List<ListContentResponseDto> content;
  final PageableDto pageable;
  final int totalElements;

  ListResponseDto(this.content, this.pageable, this.totalElements);

  factory ListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseDtoToJson(this);
}

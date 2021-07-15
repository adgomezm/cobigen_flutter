
import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_content_response_dto.dart';

part 'employee_list_response_dto.g.dart';

class EmployeeListResponseDto {
  final List<EmployeeListContentResponseDto> content;
  final PageableDto pageable;
  final int totalElements;

  EmployeeListResponseDto(this.content, this.pageable, this.totalElements);

  factory EmployeeListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListResponseDtoToJson(this);
}

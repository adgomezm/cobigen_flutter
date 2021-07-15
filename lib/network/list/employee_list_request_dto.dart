
import 'package:flutter_springboot/network/common/pageable_dto.dart';

part 'employee_list_request_dto.g.dart';

class EmployeeListRequestDto {
  final String? employeeId;
  final String? name;
  final String? surname;
  final String? email;
  final PageableDto pageable;

  EmployeeListRequestDto(
      this.employeeId, this.name, this.surname, this.email, this.pageable);

  factory EmployeeListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EmployeeListRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeListRequestDtoToJson(this);
}

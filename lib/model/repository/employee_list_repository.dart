
import 'dart:convert';

import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:flutter_springboot/network/common/pageable_sort_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_request_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_response_dto.dart';

import 'package:http/http.dart' as http;

class EmployeeListRepository  {

  Future<EmployeeListResponseDto> getData(int pageSize, int pageNumber) async {
    var url = 'http://localhost:8081/services/rest/employeemanagement/v1/employee/search';
    var sort = PageableSortDto("employeeId", "ASC");
    var pageable = PageableDto(pageSize, pageNumber, [sort]);
    final response = await http.post(
        Uri.parse(url),
         
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
         
        body: EmployeeListRequestDto(null, null, null, null, pageable).toJson());
          print("response body ${response.body}");
    return json.decode(response.body);
  }

}
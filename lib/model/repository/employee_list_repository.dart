import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:flutter_springboot/network/common/pageable_sort_dto.dart';
import 'package:flutter_springboot/network/detail/employee_detail_response_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_request_dto.dart';
import 'package:flutter_springboot/network/list/employee_list_response_dto.dart';
import 'package:flutter_springboot/network/login/login_request_dto.dart';
//import 'package:http/http.dart' as http;

class EmployeeRepository {
  final Dio _dio = Dio();

  Future<EmployeeListResponseDto> getData(int pageSize, int pageNumber) async {
    var url =
        'http://localhost:8081/services/rest/employeemanagement/v1/employee/search';
    var sort = PageableSortDto("employeeId", "ASC");
    var pageable = PageableDto(pageSize, pageNumber, [sort]);
    final response = await _dio.post(url,
        data:
            EmployeeListRequestDto(null, null, null, null, pageable).toJson());
  final value = EmployeeListResponseDto.fromJson(response.data); 
    return value;
  }

// Future<EmployeeListResponseDto> getData(int pageSize, int pageNumber) async {
//     var url = 'http://localhost:8081/services/rest/employeemanagement/v1/employee/search';
//     var url =
//         'http://localhost:8081/services/rest/employeemanagement/v1/employee/search';
//     var sort = PageableSortDto("employeeId", "ASC");
//     var pageable = PageableDto(pageSize, pageNumber, [sort]);
//     final response = await http.post(
//         Uri.parse(url),

//         headers: {
//           "Accept": "application/json",
//           "Access-Control_Allow_Origin": "*"
//         },

//         body: EmployeeListRequestDto(null, null, null, null, pageable).toJson());
//           print("response body ${response.body}");
// final value = EmployeeListResponseDto.fromJson(response.data); 
//     return value;












  Future<void> login(String username, String password) async {
    var url = 'http://localhost:8081/services/rest/login';
    final response =
        await _dio.post(url, data: LoginRequestDto(username, password));

    return null;
  }
    Future<EmployeeDetailResponseDto> getDetail(int id) async {
      EmployeeDetailResponseDto? user; 
      var url = 'http://localhost:8081/services/rest/employeemanagement/v1/employee/$id'; 
      final response = await _dio.get(url); 
      user = EmployeeDetailResponseDto.fromJson(response.data); 
      return user;
  }

}

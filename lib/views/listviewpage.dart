import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_springboot/network/common/pageable_dto.dart';
import 'package:flutter_springboot/network/common/pageable_sort_dto.dart';
import 'package:flutter_springboot/network/list/list_content_response_dto.dart';
import 'package:flutter_springboot/network/list/list_request_dto.dart';
import 'package:flutter_springboot/network/list/list_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_springboot/views/addemployee.dart';
import 'package:flutter_springboot/views/detailpage.dart';

class ListEmployees extends StatefulWidget {
  @override
  _ListEmployeesState createState() => _ListEmployeesState();
}

class _ListEmployeesState extends State<ListEmployees> {
  List data;

  Future<ListResponseDto> getData() async {
    var sort = PageableSortDto("employeeId", "ASC");
    var pageable = PageableDto(10, 0, [sort]);
    final response = await http.post(
        "http://localhost:8081/services/rest/employeemanagement/v1/employee/search",
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: ListRequestDto(null, null, null, null, pageable));
    return json.decode(response.body);
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataEmployee()),
    );

    if (result) {
      setState(() {});
    }
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews Employees"),
        automaticallyImplyLeading: false, //evita que muestre flecha de regresar
        actions: [
          RaisedButton(
            color: Colors.black12,
            child: Icon(Icons.add),
            onPressed: () => _navigateAndDisplaySelection(context),
          ),
        ],
      ),
      body: new FutureBuilder<ListResponseDto>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final ListResponseDto list;
  ListContentResponseDto item;
  ItemList({this.list, this.item});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.totalElements,
      itemBuilder: (context, i) {
        return Column(
          children: [
            new Container(
              padding: const EdgeInsets.all(10.0),
              child: new GestureDetector(
                onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            //list: list,
                            index: i,
                          )),
                ),
                child: Container(
                  //color: Colors.black,
                  height: 100.3,
                  child: new Card(
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // add this
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  item.name.toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  item.email.toString(),
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black87),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

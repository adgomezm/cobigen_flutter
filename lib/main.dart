import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:flutter_springboot/views/newlistviewpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter crud',
      initialRoute: "/employeeList",
      routes: <String,WidgetBuilder>{
        "/employeeList": (context) => EmployeeListNormalView(), 
        // "/login": (context) => Login(), 
        //"/employeeDetail": (context) => DetailEmployees(), 
        //"/employeeAdd": (context) => AddEmployee(),  
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_springboot/controllers/databasehelpers.dart';
import 'package:flutter_springboot/views/listviewpage.dart';

class AddDataEmployee extends StatefulWidget {
  AddDataEmployee({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AddDataEmployeeState createState() => _AddDataEmployeeState();
}

class _AddDataEmployeeState extends State<AddDataEmployee> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  final TextEditingController nameController = new TextEditingController();
  final TextEditingController priceController = new TextEditingController();
  final TextEditingController quantityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Employee',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Add Employee'),
        // ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'name',
                    hintText: 'Employee name',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: priceController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'price',
                    hintText: 'Place your price',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'quantity',
                    hintText: 'Place your quantity',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: () {
                    //databaseHelper.addDataEmployeeo();
                    databaseHelper.addDataEmployeeo(
                        nameController.text.trim(),
                        priceController.text.trim(),
                        quantityController.text.trim());
                    Navigator.pop(context, true);
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

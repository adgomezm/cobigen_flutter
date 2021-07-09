import 'dart:convert';
import 'package:http/http.dart' as http;

class DataBaseHelper {
  //Funcion para agregar un producto a la BD
  Future<http.Response> addDataEmployeeo(String nameController,
      String quantityController, String priceController) async {
    var url = 'http://localhost:8081/addEmployee';

    Map data = {
      'name': '$nameController',
      'quantity': '$quantityController',
      'price': '$priceController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }

  //function for update or put
  Future<http.Response> editarEmployee(String id, String nameController,
      String quantityController, String priceController) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://localhost:8081/update';

    Map data = {
      'id': '$a',
      'name': '$nameController',
      'quantity': '$quantityController',
      'price': '$priceController',
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.put(url,
        headers: {"Content-Type": "application/json"}, body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
  // void editarEmployee(
  //     String _id, String name, String price, String stock) async {

  //   String myUrl = "http://localhost:8081/product/$_id";
  //   http.put(myUrl, body: {
  //     "name": "$name",
  //     "price": "$price",
  //     "stock": "$stock"
  //   }).then((response) {
  //     print('Response status : ${response.statusCode}');
  //     print('Response body : ${response.body}');
  //   });
  // }

  //Funcion para agregar un producto a la BD
  Future<http.Response> removeRegister(String id) async {
    int a = int.parse(id);
    print(a);
    var url = 'http://localhost:8081/delete/$a';

    var response =
        await http.delete(url, headers: {"Content-Type": "application/json"});
    print("${response.statusCode}");
    return response;
  }
}

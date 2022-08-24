import 'dart:convert';

import 'package:http/http.dart' as http;
class Student{
  // String baseUrl="http://127.0.0.1:8000/api/student";

  Future<List> getStudent() async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:8000/api/student');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
      return Future.error("Server Error");
    }
  }
}
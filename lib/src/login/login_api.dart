import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/src/login/user_model/user.dart';

class ApiOfUsers {
  final String apiUrl = 'https://login-signup-agou.onrender.com/api/users';
  Future<List<UserData>> fetchUsers() async {
    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri);
    {
      final body = response.body;
      final json = jsonDecode(body);

      if (json['data'] is List) {
        List<dynamic> dataList = json['data'];
        return dataList.map((userJson) => UserData.fromJson(userJson)).toList();
      } else {
        throw Exception('Invalid JSON format - data is not a list');
      }
    }
  }
}

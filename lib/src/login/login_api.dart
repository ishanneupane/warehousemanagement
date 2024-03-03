import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:warehousemanagement/src/login/user_model/user.dart';

class ApiOfUsers {
  final String apiUrl = 'https://login-signup-agou.onrender.com/api/users';

  Future<List<UserData>> fetchUsers() async {
    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);

      return (json as List<dynamic>)
          .map((userJson) => UserData.fromJson(userJson))
          .toList();
    } else {
      return [];
    }
  }
}

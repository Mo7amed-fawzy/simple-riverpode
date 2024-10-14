import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_riverpode/utils/Models/user_model.dart';

class UserApiService {
  Future<List<User>> fetchUser() async {
    const String baseUrl = 'https://reqres.in/api';
    http.Response response = await http.get(Uri.parse('$baseUrl/users'));
    // ignore: unrelated_type_equality_checks
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => User.fromJson(item)).toList();
      // دي طريقة مختلفه بدال ال if condition
    } else {
      throw Exception('Failed to load the User');
    }
  }
}

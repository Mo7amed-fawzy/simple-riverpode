import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_riverpode/utils/Models/user_model.dart';
import 'package:simple_riverpode/utils/helper/end_points.dart';

class GetUserApiService {
  Future<List<User>> fetchUser() async {
    http.Response response =
        await http.get(Uri.parse('${Endpoint.userUrl}/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['data'];
      return data.map((item) => User.fromJson(item)).toList();
      // دي طريقة مختلفه بدال ال if condition
    } else {
      throw Exception('Failed to load the User');
    }
  }
}

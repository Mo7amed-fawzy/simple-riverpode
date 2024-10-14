import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:simple_riverpode/utils/Models/create_user_model.dart';
import 'package:simple_riverpode/utils/helper/end_points.dart';

class PostUserApiService {
  Future<PostUserModel> postUser(String name, String job) async {
    http.Response response = await http.post(
      Uri.parse('${Endpoint.userUrl}/users'),
      body: jsonEncode(
        {ApiKey.status: name, ApiKey.job: job},
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      return PostUserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Create User');
    }
  }
}

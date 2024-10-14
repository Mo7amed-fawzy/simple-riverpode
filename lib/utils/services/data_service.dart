import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Models/data_model.dart';

class DataService {
  Future<List<DataModel>> fetchData() async {
    List<DataModel> listDataModel = [];
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List<dynamic> decodedData = jsonDecode(response.body);

      for (var item in decodedData) {
        listDataModel.add(DataModel.fromMap(item));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return listDataModel;
  }
}

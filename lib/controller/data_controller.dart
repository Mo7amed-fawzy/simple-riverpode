import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:simple_riverpode/Models/data_model.dart'; // بعمل بيها ريكويست للسيرفر

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<DataModel> listDataMolde = [];
  GetDataFromApi() {
    // اول متاخد انستانس من الكلاس ناديلي علفنكشن دي
    getData();
  }

  Future getData() async {
    listDataMolde = [];
    try {
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List<dynamic> decodedDatat = jsonDecode(response.body);

      for (int i = 0; i < decodedDatat.length; i++) {
        listDataMolde.add(DataModel.fromMap(decodedDatat[i]));
      }
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }
}

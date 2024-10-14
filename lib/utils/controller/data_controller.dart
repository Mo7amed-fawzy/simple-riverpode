import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_riverpode/utils/services/data_service.dart';
import '../Models/data_model.dart';

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<DataModel> listDataModel = [];
  final DataService _getapiService = DataService();

  // كدا بقولو فالكونستركتور كل متستعمل الكلاس استعمل الميثود بتعته
  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    listDataModel = await _getapiService.fetchData();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:task/model/data_model.dart';
import 'package:task/service/api_service.dart';

class ApiProvider extends ChangeNotifier {
  List<DataModel>? datas = [];
  ApiService service = ApiService();
  Future<List<DataModel>> fetchData() async {
    try {
      datas = await service.getData();
      notifyListeners();
      return datas!;
    } catch (e) {
      throw Exception(e);
    }
  }
}

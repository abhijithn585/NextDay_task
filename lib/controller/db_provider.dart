import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task/model/data_model.dart';

class DbProvider extends ChangeNotifier {
  List<DataModel> dataList = [];

  Future<void> addFavorite(DataModel value) async {
    final favoritDB = await Hive.box<DataModel>('favorite_db');
    await favoritDB.add(value);
    dataList.add(value);
    print('Database Values${favoritDB.values}');
    notifyListeners();
  }

  Future<List<DataModel>> getAllFavorits() async {
    final favoritDB = await Hive.box<DataModel>('favorite_db');
   dataList.clear();
    dataList.addAll(favoritDB.values);
    notifyListeners();
    return [];
  }

  deleteFavoraits(int index) async {
    final favoritDB = await Hive.openBox<DataModel>('favorite_db');
    await favoritDB.deleteAt(index);
    notifyListeners();
    getAllFavorits();
  }
}

import 'package:dio/dio.dart';
import 'package:task/model/data_model.dart';

class ApiService {
  final api = "https://reqres.in/api/users?page=2";
  Dio dio = Dio();
  Future<List<DataModel>> getData() async {
    try {
      Response response = await dio.get(api);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data!;
        final List<dynamic> data = responseData['data'];
        return data.map((datas) => DataModel.fromJson(datas)).toList();
      } else {
        print("status code error${response.statusCode}");
        throw Exception('status code error${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

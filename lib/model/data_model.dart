import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? firstname;
  @HiveField(3)
  String? lastname;
  @HiveField(4)
  String? avatar;
  @HiveField(5)

  DataModel({this.id, this.email, this.firstname, this.lastname, this.avatar,});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        id: json['id'],
        firstname: json['first_name'],
        lastname: json['last_name'],
        email: json['email'],
        avatar: json['avatar']);
  }
}

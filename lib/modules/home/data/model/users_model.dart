import 'package:movie_app/modules/home/domain/entity/users_entity.dart';

class UsersModel extends UsersEntity {
  UsersModel({
    required super.name,
    required super.surname,
    required super.fullName,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      fullName: json['fullName'] ?? '',
    );
  }
}

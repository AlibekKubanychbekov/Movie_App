import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/core/service/shared_prefs.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/data/model/users_model.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';
import 'package:movie_app/modules/home/domain/repository/users_repo.dart';

class UsersRepoImpl implements UsersRepo {
  final prefs = di<SharedPrefs>();
  Future<List<dynamic>> _readJson() async {
    final String response =
        await rootBundle.loadString('assets/movie_data.json');
    return await json.decode(response);
  }

  @override
  Future<List<UsersEntity>> fetchUsers() async {
    final result = await _readJson();
    return result.map((e) => UsersModel.fromJson(e)).toList();
  }

  void addToAddUsers({required UsersEntity entity}) async {
    final Map<String, dynamic> map = <String, dynamic>{
      'name': entity.name,
      'surname': entity.surname,
      'fullName': entity.fullName,
    };

    String dataToSave = '';
    final List mapDataToList = [];

    final String favoriteMovies =
        await prefs.read(key: SharedPrefsKeys.favoriteUsers);
    if (favoriteMovies == '') {
      dataToSave = jsonEncode([map]);
    } else {
      mapDataToList.addAll(jsonDecode(favoriteMovies));
      mapDataToList.add(map);
      final isContains =
          mapDataToList.map((e) => e['title']).toList().contains(map['title']);
      if (isContains) {
      } else {
        mapDataToList.add(map);
        dataToSave = jsonEncode(mapDataToList);
      }
      dataToSave = jsonEncode(mapDataToList);
    }
    prefs.save(key: SharedPrefsKeys.favoriteUsers, data: dataToSave);
  }

  Future<List<UsersEntity>> fetchFavoritesUsers() async {
    final favoriteUsers = await prefs.read(key: SharedPrefsKeys.favoriteUsers);
    final List mapDataToList = jsonDecode(favoriteUsers);

    return mapDataToList.map((e) => UsersModel.fromJson(e)).toList();
  }

  @override
  Future<List<UsersEntity>> fetchAddUsers() {
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromUsers() {
    throw UnimplementedError();
  }
}

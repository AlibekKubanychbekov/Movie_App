import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/core/service/shared_prefs.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/modules/home/data/model/movies_model.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
  final prefs = di<SharedPrefs>();
  Future<List<dynamic>> _readJson() async {
    final String response =
        await rootBundle.loadString('assets/movie_data.json');
    return await json.decode(response);
  }

  @override
  Future<List<MoviesEntity>> fetchMovies() async {
    final result = await _readJson();
    return result.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  void addToFavorites({required MoviesEntity entity}) async {
    final Map<String, dynamic> map = <String, dynamic>{
      'title': entity.title,
      'descreption': entity.description,
      'poster_url': entity.posterUrl,
      'releaseDate': entity.releaseDate,
      'duration': entity.duration,
      'rating': entity.rating.toString(),
    };

    String dataToSave = '';

    final String favoriteMovies =
        await prefs.read(key: SharedPrefsKeys.favoriteMovies);
    if (favoriteMovies == '') {
      dataToSave = jsonEncode([map]);
    } else {
      final List mapDataToList = jsonDecode(favoriteMovies);
      dataToSave = jsonEncode(mapDataToList);
    }
    prefs.save(key: SharedPrefsKeys.favoriteMovies, data: dataToSave);
  }

  @override
  Future<List<MoviesEntity>> fetchFavoritesMovies() async {
    final favoriteMovies =
        await prefs.read(key: SharedPrefsKeys.favoriteMovies);
    final List json = jsonDecode(favoriteMovies);

    return json.map((e) => MoviesModel.fromJson(e)).toList();
  }

  @override
  Future<void> removeFromFavorites() {
    // TODO: implement removeFromFavorites
    throw UnimplementedError();
  }
}

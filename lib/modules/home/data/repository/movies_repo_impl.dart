import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:movie_app/modules/home/data/model/movies_model.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
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
}

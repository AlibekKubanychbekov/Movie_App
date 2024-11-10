import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';

abstract class MoviesRepo {
  Future<List<MoviesEntity>> fetchMovies();
}

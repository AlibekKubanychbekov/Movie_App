import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';

class FetchMoviesUsecase
    implements BaseUsecase<List<MoviesEntity>, FetchMoviesUsecaseParams> {
  final MoviesRepo _repo;

  FetchMoviesUsecase({required MoviesRepo repo}) : _repo = repo;
  @override
  Future<List<MoviesEntity>> execute(
      {required FetchMoviesUsecaseParams params}) {
    return _repo.fetchMovies();
  }
}

class FetchMoviesUsecaseParams extends BaseParams {}

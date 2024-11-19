import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';

class FetchFavoriteMoviesUsecase
    implements BaseUsecase<List<MoviesEntity>, FetchFavoriteMoviesParams> {
  final MoviesRepo _repo;

  FetchFavoriteMoviesUsecase({required MoviesRepo repo}) : _repo = repo;
  @override
  Future<List<MoviesEntity>> execute(
      {required FetchFavoriteMoviesParams params}) {
    return _repo.fetchFavoritesMovies();
  }
}

class FetchFavoriteMoviesParams extends BaseParams {}

import 'package:get_it/get_it.dart';
import 'package:movie_app/core/base/base_di.dart';
import 'package:movie_app/modules/home/data/repository/movies_repo_impl.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';

class HomeDi extends BaseDi {
  @override
  void registerModule(GetIt di) {
    di.registerSingleton<MoviesRepo>(
      MoviesRepoImpl(),
    );
    di.registerFactory(
      () => FetchMoviesUsecase(
        repo: di(),
      ),
    );
    di.registerFactory(
      () => MoviesBloc(
        fetchMoviesUsecase: di(),
      ),
    );
  }
}

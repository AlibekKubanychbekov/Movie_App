import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/data/repository/movies_repo_impl.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_bloc.dart';

void setup(GetIt di) {
  di.registerSingleton(
    MoviesBloc(
      fetchMoviesUsecase: FetchMoviesUsecase(
        repo: MoviesRepoImpl(),
      ),
    ),
  );
}

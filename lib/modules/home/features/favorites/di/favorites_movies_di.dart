import 'package:get_it/get_it.dart';
import 'package:movie_app/core/base/base_di.dart';
import 'package:movie_app/modules/home/domain/usecase/add_to_favorites_usecase.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorite_movies_bloc.dart';

class FavoritesMoviesDi extends BaseDi {
  @override
  void registerModule(GetIt di) {
    di.registerFactory(
      () => AddToFavoritesUsecase(
        repository: di(),
      ),
    );
    di.registerFactory(
      () => FavoriteMoviesBloc(
        addToFavoritesUsecase: di(),
      ),
    );
  }
}

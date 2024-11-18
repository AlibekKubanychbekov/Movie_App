import 'package:get_it/get_it.dart';
import 'package:movie_app/core/service/shared_prefs.dart';
import 'package:movie_app/modules/home/features/favorites/di/favorites_movies_di.dart';
import 'package:movie_app/modules/home/features/home/di/home_di.dart';

void setup(GetIt di) {
  HomeDi().registerModule(di);
  di.registerFactory(
    () => SharedPrefs(),
  );
  FavoritesMoviesDi().registerModule(di);
}

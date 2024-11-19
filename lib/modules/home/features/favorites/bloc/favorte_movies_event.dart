import 'package:movie_app/core/base/base_event.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';

class FavorteMoviesEvent extends BaseEvent {}

class AddToFavoritesEvent extends FavorteMoviesEvent {
  final MoviesEntity entity;

  AddToFavoritesEvent({required this.entity});
}

class FetchFavoriteMovies extends FavorteMoviesEvent {}

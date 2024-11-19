import 'package:movie_app/core/base/base_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/modules/home/domain/usecase/add_to_favorites_usecase.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_favorite_movies_usecase.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_event.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_state.dart';

class FavoriteMoviesBloc
    extends BaseBloc<FavorteMoviesEvent, FavorteMoviesState> {
  final AddToFavoritesUsecase _addToFavoritesUsecase;
  final FetchFavoriteMoviesUsecase _favoriteMoviesUsecase;
  FavoriteMoviesBloc(
      {required AddToFavoritesUsecase addToFavoritesUsecase,
      required FetchFavoriteMoviesUsecase favoriteMoviesUsecase})
      : _addToFavoritesUsecase = addToFavoritesUsecase,
        _favoriteMoviesUsecase = favoriteMoviesUsecase,
        super(FavorteMoviesState(
          status: StateStatus.initial,
        )) {
    on<AddToFavoritesEvent>(
      (event, emit) async {
        emit(
          FavorteMoviesState(status: StateStatus.loading),
        );
        try {
          await _addToFavoritesUsecase.execute(
              params: AddToFavoritesParams(entity: event.entity));
          emit(
            FavorteMoviesState(status: StateStatus.loaded, model: []),
          );
        } catch (e) {
          emit(
            FavorteMoviesState(status: StateStatus.error),
          );
        }
      },
    );
    on<FetchFavoriteMovies>(
      (event, emit) async {
        emit(
          FavorteMoviesState(status: StateStatus.loading),
        );
        try {
          final result = await _favoriteMoviesUsecase.execute(
              params: FetchFavoriteMoviesParams());
          emit(
            FavorteMoviesState(status: StateStatus.loaded, model: result),
          );
        } catch (e) {
          emit(
            FavorteMoviesState(status: StateStatus.error),
          );
        }
      },
    );
  }
}

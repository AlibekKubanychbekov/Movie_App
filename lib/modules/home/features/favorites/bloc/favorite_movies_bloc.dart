import 'package:movie_app/core/base/base_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/modules/home/domain/usecase/add_to_favorites_usecase.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_favorite_movies_usecase.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_event.dart';
import 'package:movie_app/modules/home/features/favorites/bloc/favorte_movies_state.dart';

class FavoriteUsersBloc
    extends BaseBloc<FavorteUsersEvent, FavoriteUsersState> {
  final AddToUsersUsecase _addToUsersUsecase;
  final FetchFavoriteMoviesUsecase _favoriteUsersUsecase;
  FavoriteUsersBloc(
      {required AddToUsersUsecase addToUsersUsecase,
      required FetchFavoriteMoviesUsecase favoriteUsersUsecase})
      : _addToUsersUsecase = addToUsersUsecase,
        _favoriteUsersUsecase = favoriteUsersUsecase,
        super(FavoriteUsersState(
          status: StateStatus.initial,
        )) {
    on<AddToUsersEvent>(
      (event, emit) async {
        emit(
          FavoriteUsersState(status: StateStatus.loading),
        );
        try {
          await _addToUsersUsecase.execute(
              params: AddToUsersParams(entity: event.entity));
          emit(
            FavoriteUsersState(status: StateStatus.loaded, model: []),
          );
        } catch (e) {
          emit(
            FavoriteUsersState(status: StateStatus.error),
          );
        }
      },
    );
    on<FetchUserMovies>(
      (event, emit) async {
        emit(
          FavoriteUsersState(status: StateStatus.loading),
        );
        try {
          final result = await _favoriteUsersUsecase.execute(
              params: FetchUsersMoviesParams());
          emit(
            FavoriteUsersState(status: StateStatus.loaded, model: result),
          );
        } catch (e) {
          emit(
            FavoriteUsersState(status: StateStatus.error),
          );
        }
      },
    );
  }
}

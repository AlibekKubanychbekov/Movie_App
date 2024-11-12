import 'package:movie_app/core/base/base_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/movie_details/presentation/bloc/movies_event.dart';
import 'package:movie_app/modules/home/movie_details/presentation/bloc/movies_state.dart';

class MoviesBloc extends BaseBloc<MoviesEvent, MoviesState> {
  final FetchMoviesUsecase _fetchMoviesUsecase;
  MoviesBloc({required FetchMoviesUsecase fetchMoviesUsecase})
      : _fetchMoviesUsecase = fetchMoviesUsecase,
        super(
          MoviesState(
            status: StateStatus.initial,
          ),
        ) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesState(status: StateStatus.loading));
      try {
        final result = await _fetchMoviesUsecase.execute();
        emit(MoviesState(
          status: StateStatus.loaded,
          model: result,
        ));
      } catch (e) {
        emit(MoviesState(
          status: StateStatus.error,
        ));
      }
    });
  }
}

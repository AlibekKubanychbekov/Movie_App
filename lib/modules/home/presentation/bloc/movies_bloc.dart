import 'package:movie_app/core/base/base_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_event.dart';
import 'package:movie_app/modules/home/presentation/bloc/movies_state.dart';

class MoviesBloc extends BaseBloc<MoviesEvent, MoviesState> {
  MoviesBloc()
      : super(
          MoviesState(
            status: StateStatus.initial,
          ),
        );
}

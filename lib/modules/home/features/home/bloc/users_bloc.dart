import 'package:movie_app/core/base/base_bloc.dart';
import 'package:movie_app/core/enums/state_status.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/features/home/bloc/users_event.dart';
import 'package:movie_app/modules/home/features/home/bloc/users_state.dart';

class UsersBloc extends BaseBloc<UsersEvent, UsersState> {
  final FetchUsersUsecase _fetchUsersUsecase;
  UsersBloc({required FetchUsersUsecase fetchUsersUsecase})
      : _fetchUsersUsecase = fetchUsersUsecase,
        super(
          UsersState(
            status: StateStatus.initial,
          ),
        ) {
    on<FetchUsersEvent>(
      (event, emit) async {
        emit(UsersState(status: StateStatus.loading));
        try {
          final result = await _fetchUsersUsecase.execute(
              params: FetchUsersUsecaseParams());
          emit(UsersState(
            status: StateStatus.loaded,
            model: result,
          ));
        } catch (e) {
          emit(
            UsersState(
              status: StateStatus.error,
            ),
          );
        }
      },
    );
  }
}

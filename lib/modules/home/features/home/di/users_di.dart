import 'package:get_it/get_it.dart';
import 'package:movie_app/core/base/base_di.dart';
import 'package:movie_app/modules/home/data/repository/users_repo_impl.dart';
import 'package:movie_app/modules/home/domain/repository/users_repo.dart';
import 'package:movie_app/modules/home/domain/usecase/fetch_movies_usecase.dart';
import 'package:movie_app/modules/home/features/home/bloc/users_bloc.dart';

class UsersDi extends BaseDi {
  @override
  void registerModule(GetIt di) {
    di.registerSingleton<UsersRepo>(
      UsersRepoImpl(),
    );
    di.registerFactory(
      () => FetchUsersUsecase(
        repo: di(),
      ),
    );
    di.registerFactory(
      () => UsersBloc(
        fetchUsersUsecase: di(),
      ),
    );
  }
}

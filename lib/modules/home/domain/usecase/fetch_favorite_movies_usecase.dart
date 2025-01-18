import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';
import 'package:movie_app/modules/home/domain/repository/users_repo.dart';

class FetchFavoriteMoviesUsecase
    implements BaseUsecase<List<UsersEntity>, FetchUsersMoviesParams> {
  final UsersRepo _repo;

  FetchFavoriteMoviesUsecase({required UsersRepo repo}) : _repo = repo;
  @override
  Future<List<UsersEntity>> execute({required FetchUsersMoviesParams params}) {
    return _repo.fetchUsers();
  }
}

class FetchUsersMoviesParams extends BaseParams {}

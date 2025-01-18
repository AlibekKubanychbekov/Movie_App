import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';
import 'package:movie_app/modules/home/domain/repository/users_repo.dart';

class FetchUsersUsecase
    implements BaseUsecase<List<UsersEntity>, FetchUsersUsecaseParams> {
  final UsersRepo _repo;

  FetchUsersUsecase({required UsersRepo repo}) : _repo = repo;
  @override
  Future<List<UsersEntity>> execute({required FetchUsersUsecaseParams params}) {
    return _repo.fetchUsers();
  }
}

class FetchUsersUsecaseParams extends BaseParams {}

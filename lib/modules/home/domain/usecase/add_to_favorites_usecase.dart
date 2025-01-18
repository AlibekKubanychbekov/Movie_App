import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';
import 'package:movie_app/modules/home/domain/repository/users_repo.dart';

class AddToUsersUsecase extends BaseUsecase<UsersEntity, AddToUsersParams> {
  final UsersRepo _repository;

  AddToUsersUsecase({required UsersRepo repository}) : _repository = repository;
  @override
  Future<UsersEntity> execute({required AddToUsersParams params}) async {
    _repository.addToFavorites(entity: params.entity);
    return UsersEntity.empty();
  }
}

class AddToUsersParams extends BaseParams {
  final UsersEntity entity;

  AddToUsersParams({required this.entity});
}

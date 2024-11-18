import 'package:movie_app/core/base/base_params.dart';
import 'package:movie_app/core/base/base_usecase.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';
import 'package:movie_app/modules/home/domain/repository/movies_repo.dart';

class AddToFavoritesUsecase
    extends BaseUsecase<MoviesEntity, AddToFavoritesParams> {
  final MoviesRepo _repository;

  AddToFavoritesUsecase({required MoviesRepo repository})
      : _repository = repository;
  @override
  Future<MoviesEntity> execute({required AddToFavoritesParams params}) async {
    _repository.addToFavorites(entity: params.entity);
    return MoviesEntity.empty();
  }
}

class AddToFavoritesParams extends BaseParams {
  final MoviesEntity entity;

  AddToFavoritesParams({required this.entity});
}

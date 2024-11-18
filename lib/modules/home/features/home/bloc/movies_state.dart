import 'package:movie_app/core/base/base_state.dart';
import 'package:movie_app/modules/home/domain/entity/movies_entity.dart';

class MoviesState extends BaseState<List<MoviesEntity>?> {
  MoviesState({
    required super.status,
    super.model,
  });
}

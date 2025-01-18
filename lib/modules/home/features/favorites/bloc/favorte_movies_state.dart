import 'package:movie_app/core/base/base_state.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';

class FavoriteUsersState extends BaseState<List<UsersEntity>?> {
  FavoriteUsersState({
    required super.status,
    super.model,
  });
}

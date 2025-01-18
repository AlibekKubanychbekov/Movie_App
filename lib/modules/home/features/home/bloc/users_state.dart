import 'package:movie_app/core/base/base_state.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';

class UsersState extends BaseState<List<UsersEntity>?> {
  UsersState({
    required super.status,
    super.model,
  });
}

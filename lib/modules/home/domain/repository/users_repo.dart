import 'package:movie_app/modules/home/domain/entity/users_entity.dart';

abstract class UsersRepo {
  Future<List<UsersEntity>> fetchUsers();

  Future<void> removeFromUsers();

  Future<List<UsersEntity>> fetchAddUsers();
}

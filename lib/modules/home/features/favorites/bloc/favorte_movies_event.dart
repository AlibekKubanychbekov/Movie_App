import 'package:movie_app/core/base/base_event.dart';
import 'package:movie_app/modules/home/domain/entity/users_entity.dart';

class FavorteUsersEvent extends BaseEvent {}

class AddToUsersEvent extends FavorteUsersEvent {
  final UsersEntity entity;

  AddToUsersEvent({required this.entity});
}

class FetchUserMovies extends FavorteUsersEvent {}

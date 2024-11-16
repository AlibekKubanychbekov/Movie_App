import 'package:movie_app/core/enums/state_status.dart';

abstract class BaseState<T> {
  final StateStatus status;
  final T model;

  BaseState({
    required this.status,
    required this.model,
  });
}

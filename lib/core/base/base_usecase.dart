abstract class BaseUsecase<T, BaseParams> {
  Future<T> execute();
}

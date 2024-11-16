abstract class BaseUsecase<T, BaseParams> {
  Future<T> execute({required BaseParams params});
}

abstract class RemoteCrudRepository {
  Future<R> get<S, R>(String path,{
    Map<String, dynamic>? queryParameters,
    required R Function(S json) mapper,
  });
}

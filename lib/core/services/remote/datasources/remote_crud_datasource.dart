import 'package:tafeel_task/config/network/network_adapter.dart';
import 'package:tafeel_task/core/services/remote/repositories/remote_crud_repository.dart';

class RemoteCrudDatasource implements RemoteCrudRepository {
  const RemoteCrudDatasource(this._adapter);

  final NetworkAdapter _adapter;

  @override
  Future<R> get<S, R>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required R Function(S json) mapper,
  }) async {
    try {
      final response =
          await _adapter.get<S>(path, queryParameters: queryParameters);

      if (response.data is! S) {
        return Future.error("Invalid type of data");
      }

      return mapper(response.data as S);
    } catch (ex) {
      return Future.error(ex);
    }
  }
}

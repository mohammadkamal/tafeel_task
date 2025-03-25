import 'package:tafeel_task/config/network/api_endpoints.dart';
import 'package:tafeel_task/core/services/remote/repositories/remote_crud_repository.dart';
import 'package:tafeel_task/feature/data/repositories/users_repository.dart';
import 'package:tafeel_task/feature/domain/models/user_details_response.dart';
import 'package:tafeel_task/feature/domain/models/users_response.dart';

class UsersDatasource implements UsersRepository {
  final RemoteCrudRepository _crudRepository;

  UsersDatasource(this._crudRepository);

  @override
  Future<UsersResponse> getUsers(int page) async {
    final response =
        await _crudRepository.get<Map<String, dynamic>, UsersResponse>(
      ApiEndpoints.users,
      queryParameters: {'page': page},
      mapper: UsersResponse.fromJson,
    );

    return response;
  }

  @override
  Future<UserDetailsEntity> getUserDetails(int id) async {
    final response =
        await _crudRepository.get<Map<String, dynamic>, UserDetailsResponse>(
      '${ApiEndpoints.users}/$id',
      mapper: UserDetailsResponse.fromJson,
    );

    final data = response.data;
    if (data == null) return Future.error("User not found");

    return data;
  }
}

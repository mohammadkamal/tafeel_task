import 'package:tafeel_task/feature/domain/models/user_details_response.dart';
import 'package:tafeel_task/feature/domain/models/users_response.dart';

abstract class UsersRepository {
  // If it's one parameter, then I prefer to be passed as an argument

  Future<UsersResponse> getUsers(int page);
  Future<UserDetailsEntity> getUserDetails(int id);
}

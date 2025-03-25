import 'package:tafeel_task/core/controllers/base_controller.dart';
import 'package:tafeel_task/core/controllers/controller_status.dart';
import 'package:tafeel_task/core/errors/custom_error.dart';
import 'package:tafeel_task/feature/data/repositories/users_repository.dart';
import 'package:tafeel_task/feature/domain/models/user_details_response.dart';

class UserDetailsController extends BaseController {
  UserDetailsController(this._repository);

  final UsersRepository _repository;

  UserDetailsEntity? details;

  Future<void> fetchUser(int id, {bool refresh = false}) async {
    status = refresh ? ControllerStatus.refreshing : ControllerStatus.loading;
    notifyListeners();

    try {
      details = await _repository.getUserDetails(id);
      status = ControllerStatus.success;
      notifyListeners();
    } catch (ex, stackTrace) {
      error = CustomError(message: ex.toString(), stackTrace: stackTrace);
      status = ControllerStatus.failed;
      notifyListeners();
    }
  }
}

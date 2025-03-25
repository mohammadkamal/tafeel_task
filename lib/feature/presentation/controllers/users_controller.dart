import 'package:flutter/material.dart';
import 'package:tafeel_task/core/controllers/base_controller.dart';
import 'package:tafeel_task/core/controllers/controller_status.dart';
import 'package:tafeel_task/core/errors/custom_error.dart';
import 'package:tafeel_task/feature/data/repositories/users_repository.dart';
import 'package:tafeel_task/feature/domain/models/users_response.dart';

class UsersController extends BaseController {
  UsersController(this._repository) {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        if (maxPageNumber == null && status != ControllerStatus.reloading) {
          await _loadMore();
          return;
        } else {
          if (pageNumber < maxPageNumber! &&
              status != ControllerStatus.reloading) {
            await _loadMore();
          }
        }
      }
    });
  }

  final UsersRepository _repository;

  final scrollController = ScrollController();

  List<UserEntity> users = [];

  int pageNumber = 0;
  int? maxPageNumber;

  Future<void> fetchUsers({bool? refresh}) async {
    if (refresh != false) {
      await _firstLoadingUsers(refresh: refresh == true);
      return;
    }
  }

  Future<void> _firstLoadingUsers({bool refresh = false}) async {
    try {
      status = refresh ? ControllerStatus.refreshing : ControllerStatus.loading;
      users = [];
      notifyListeners();

      pageNumber = 1;
      final response = await _repository.getUsers(pageNumber);

      users = [...response.data];
      maxPageNumber = response.totalPages;
      status = ControllerStatus.success;
      notifyListeners();

      if (scrollController.position.pixels <
              scrollController.position.maxScrollExtent &&
          pageNumber < (maxPageNumber ?? 0)) {
        _loadMore();
      }
    } catch (ex, stackTrace) {
      error = CustomError(message: ex.toString(), stackTrace: stackTrace);
      status = ControllerStatus.failed;
      notifyListeners();
    }
  }

  Future<void> _loadMore() async {
    try {
      status = ControllerStatus.reloading;
      pageNumber++;
      final response = await _repository.getUsers(pageNumber);

      users = [...users, ...response.data];
      maxPageNumber = response.totalPages;
      status = ControllerStatus.success;
      notifyListeners();
    } catch (ex, stackTrace) {
      error = CustomError(message: ex.toString(), stackTrace: stackTrace);
      status = ControllerStatus.failed;
      notifyListeners();
    }
  }
}

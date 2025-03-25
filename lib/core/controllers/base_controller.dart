import 'package:flutter/foundation.dart';
import 'package:tafeel_task/core/controllers/controller_status.dart';
import 'package:tafeel_task/core/errors/custom_error.dart';

class BaseController extends ChangeNotifier {
  BaseController({this.status = ControllerStatus.none});

  ControllerStatus status;
  CustomError? error;

  bool get isLoading => status == ControllerStatus.loading;
  bool get isRefreshing => status == ControllerStatus.refreshing;
  bool get isReloading => status == ControllerStatus.reloading;

  bool get hasValue => status == ControllerStatus.success;
  bool get hasError => status == ControllerStatus.failed;
}

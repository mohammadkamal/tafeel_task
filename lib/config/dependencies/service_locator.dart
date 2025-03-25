import 'package:get_it/get_it.dart';
import 'package:tafeel_task/config/network/network_adapter.dart';
import 'package:tafeel_task/core/services/remote/datasources/remote_crud_datasource.dart';
import 'package:tafeel_task/core/services/remote/repositories/remote_crud_repository.dart';
import 'package:tafeel_task/feature/data/datasources/users_datasource.dart';
import 'package:tafeel_task/feature/data/repositories/users_repository.dart';
import 'package:tafeel_task/feature/presentation/controllers/user_details_controller.dart';
import 'package:tafeel_task/feature/presentation/controllers/users_controller.dart';

mixin ServiceLocator {
  static final instance = GetIt.instance;

  static Future<void> init() async {
    instance
      // ----------------------- Configurations ------------------------- //
      ..registerSingleton<NetworkAdapter>(NetworkAdapter())
      // ------------------------ Repositories -------------------------- //
      ..registerLazySingleton<RemoteCrudRepository>(
          () => RemoteCrudDatasource(instance()))
      ..registerLazySingleton<UsersRepository>(
          () => UsersDatasource(instance()))
      // ------------------------ Controllers --------------------------- //
      ..registerFactory(() => UsersController(instance()))
      ..registerFactory(() => UserDetailsController(instance()));
  }
}

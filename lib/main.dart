import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tafeel_task/config/dependencies/service_locator.dart';
import 'package:tafeel_task/feature/presentation/controllers/users_controller.dart';
import 'package:tafeel_task/feature/presentation/views/users_view.dart';

Future<void> main() async {
  await ServiceLocator.init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Since it's not complex app, I used provider library
    // Once it gets complex, depending on its complexity I might use BLoC, Riverpod or both
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersController>(
            create: (_) => ServiceLocator.instance()..fetchUsers()),
      ],
      // No need for routing approach, because it's a simple app
      // If it's complex, and has redircts (not necessary) I might use go_router library
      child: MaterialApp(home: UsersView()),
    );
  }
}

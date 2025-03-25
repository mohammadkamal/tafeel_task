import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tafeel_task/config/dependencies/service_locator.dart';
import 'package:tafeel_task/feature/presentation/controllers/user_details_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserDetailsController>(
      create: (_) => ServiceLocator.instance()..fetchUser(id),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: _UserDetailsBody(),
      ),
    );
  }
}

class _UserDetailsBody extends StatelessWidget {
  const _UserDetailsBody();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserDetailsController>(builder: (_, controller, __) {
      return Skeletonizer(
        enabled: controller.isLoading,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 100,
              child: controller.details?.avatar == null
                  ? Icon(Icons.person)
                  : Image.network(controller.details!.avatar!),
            ),
            SizedBox(width: 20),
            Column(
              children: [
                Text(controller.details?.fullName ?? ''),
                if (controller.details?.email != null) ...[
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () => launchUrlString(
                            'mailto:${controller.details!.email!}',
                            mode: LaunchMode.externalNonBrowserApplication,
                          ),
                      child: Text(controller.details?.email ?? '')),
                ],
              ],
            )
          ],
        ),
      );
    });
  }
}

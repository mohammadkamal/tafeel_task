import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tafeel_task/feature/presentation/controllers/users_controller.dart';
import 'package:tafeel_task/feature/presentation/views/user_card.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users')),
      body: const _UsersListView(),
    );
  }
}

class _UsersListView extends StatelessWidget {
  const _UsersListView();

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersController>(
      builder: (_, controller, __) {
        return RefreshIndicator(
          onRefresh: () async =>
              context.read<UsersController>().fetchUsers(refresh: true),
          child: CustomScrollView(
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    ...controller.users.map((u) => UserCard(
                          name: u.fullName,
                          id: u.id,
                          avatar: u.avatar,
                        )),
                    if (controller.isLoading ||
                        controller.isRefreshing ||
                        controller.isReloading) ...[
                      Skeletonizer(
                          child: Column(
                        children: [
                          ...List.generate(
                              10, (u) => UserCard(name: 'Placeholder'))
                        ],
                      ))
                    ],
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tafeel_task/feature/presentation/views/user_details_view.dart';

class UserCard extends StatelessWidget {
  final int? id;
  final String? avatar;
  final String name;

  const UserCard({super.key, this.avatar, required this.name, this.id});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 50,
        child: avatar == null ? Icon(Icons.person) : Image.network(avatar!),
      ),
      title: Text(name),
      onTap: () {
        if (id == null) return;
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => UserDetailsView(id: id!)));
      },
    );
  }
}

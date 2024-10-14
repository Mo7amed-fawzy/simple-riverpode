import 'package:flutter/material.dart';
import 'package:simple_riverpode/utils/Models/user_model.dart';

class UsersListView extends StatelessWidget {
  final List<User> users;
  const UsersListView({
    super.key,
    required this.users,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email),
        );
      },
    );
  }
}

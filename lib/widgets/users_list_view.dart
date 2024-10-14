import 'package:flutter/material.dart';
import 'package:simple_riverpode/utils/Models/user_model.dart';
import 'package:simple_riverpode/view/data_list.dart';

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
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DataList(),
              ),
            );
          },
          splashColor: Colors.cyan.withOpacity(0.3), // الضغط مع السحب
          highlightColor: Colors.blue.withOpacity(0.5), // الضغط العادي
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
          ),
        );
      },
    );
  }
}

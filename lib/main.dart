import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/functions/error_handel.dart';
import 'package:simple_riverpode/utils/controller/user_controller.dart';
import 'package:simple_riverpode/view/users_list_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userscontroller = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userscontroller.when(
        data: (users) {
          return UsersListView(
            users: users,
          );
        },
        error: (error, stack) => errorHandler(error, stack),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/controller/user_controller.dart';
import 'package:simple_riverpode/utils/helper/error_handel.dart';
import 'package:simple_riverpode/utils/helper/show_modal_bottom_sheet.dart';
import 'package:simple_riverpode/widgets/users_list_view.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserBottomSheet(context, ref);
        },
        child: const Icon(Icons.add),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}

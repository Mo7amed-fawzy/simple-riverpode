import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/Models/user_model.dart';
import 'package:simple_riverpode/utils/services/api_service.dart';

final userApiServiceProvider = Provider<UserApiService>((ref) {
  return UserApiService();
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(userApiServiceProvider).fetchUser();
  // طريقة مختلفه
});

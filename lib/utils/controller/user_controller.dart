import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpode/utils/Models/create_user_model.dart';
import 'package:simple_riverpode/utils/Models/user_model.dart';
import 'package:simple_riverpode/utils/services/get_user.dart';
import 'package:simple_riverpode/utils/services/post_user.dart';

final userApiServiceProvider = Provider<GetUserApiService>((ref) {
  return GetUserApiService();
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(userApiServiceProvider).fetchUser();
  // طريقة مختلفه
});

class UserNotifire extends StateNotifier<PostUserModel?> {
  // يعني ممكن ميكنش في مستخدم حالي
  final PostUserApiService apiService;

  UserNotifire(this.apiService) : super(null); // الحالة الاولية

  Future<void> postUser(String name, String job) async {
    try {
      final user = await apiService.postUser(name, job);
      state = user; // لو تم بنجاح هحدث ال(state) للمتغير user
    } catch (e) {
      state = null; // لو حصلت مشكلة
    }
  }
}

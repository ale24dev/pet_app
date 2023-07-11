import 'package:pet_app/src/core/utils/riverpod.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
// ignore: prefer_void_to_null
class LogoutController extends _$LogoutController with SideEffect<void, Null> {
  @override
  Future<void> build(param) async {}

  Future<bool> logout() => mutation(
        mutation: () async {
          final logout = await ref.read(authRepositoryProvider).logout();
          if (logout) ref.invalidate(authRepositoryProvider);
          return logout;
        },
      );
}
import 'package:pet_app/src/core/utils/riverpod.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class LogoutController extends _$LogoutController with SideEffect<void> {
  @override
  Future<void> build() async {}

  Future<bool> logout() => mutation(
        mutation: () async {
          final logout = await ref.read(authRepositoryProvider).logout();
          if (logout) ref.invalidate(authRepositoryProvider);
          return logout;
        },
      );
}
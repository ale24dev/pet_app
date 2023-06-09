import 'dart:async';

import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<bool> login(
      {required String email,
      required String password,
      bool rememberEmail = false}) async {

    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.login(email: email, password: password));

    final success = state.hasError == false;
    // if (success) unawaited(authRepository.getUser());
    // if (success && rememberEmail) unawaited(_rememberEmail(email: email, rememberEmail: rememberEmail));

    return success;
  }

  Future<bool> logout() async {
    // final authRepository = ref.read(authRepositoryProvider);

    // state = const AsyncValue.loading();
    // state = await AsyncValue.guard(
    //     () => authRepository.signOut());

    // final success = state.hasError == false;
    // if (success) unawaited(authRepository.getUser());
    // if (success && rememberEmail) unawaited(_rememberEmail(email: email, rememberEmail: rememberEmail));

    // return success;
    return true;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(supabaseClient: SupabaseService.supabaseClient);

import 'dart:async';

import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/auth/data/auth_repository.dart';
import 'package:pet_app/src/feature/auth/domain/current_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<CurrentUser> build() {
    if (!CurrentUser.instance.initializated &&
        SupabaseService.supabaseClient.auth.currentSession != null) {
      return ref.read(authRepositoryProvider).getUser();
    } else {
      return CurrentUser.instance;
    }
  }

  Future<bool> login(
      {required String email,
      required String password,
      bool rememberEmail = false}) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.login(email: email, password: password));

    final success = state.hasError == false;
    // if (success) {
    // state = state.cop
    // user = await authRepository.getUser();
    // userInitializated = true;
    // }
    // if (success && rememberEmail) unawaited(_rememberEmail(email: email, rememberEmail: rememberEmail));

    return success;
  }

  Future<bool> signup(
      {required String email,
      required String password,
      bool rememberEmail = false}) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => authRepository.signup(email: email, password: password));

    final success = state.hasError == false;
    if (success) {
      // user = await authRepository.getUser();
      // userInitializated = true;
    } // if (success && rememberEmail) unawaited(_rememberEmail(email: email, rememberEmail: rememberEmail));

    return success;
  }

  
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(supabaseClient: SupabaseService.supabaseClient);

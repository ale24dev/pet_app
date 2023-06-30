import 'dart:async';

import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/auth/data/auth_repository.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

class CurrentUser {
  final User? user;
  final bool initializated;

  const CurrentUser({this.user, this.initializated = false});

  CurrentUser copyWith({final User? user, final bool? initializated}) => CurrentUser(
    user: user ?? this.user, initializated: initializated ?? this.initializated
  );
}

@riverpod
class AuthController extends _$AuthController {

  @override
  FutureOr<User?> build() {
    return ref.read(authRepositoryProvider).getUser();
  }

  Future<bool> login(
      {required String email,
      required String password,
      bool rememberEmail = false}) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () =>  authRepository.login(email: email, password: password));

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

  Future<bool> logout() async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => authRepository.logout());

    final success = state.hasError == false;

    return success;
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(supabaseClient: SupabaseService.supabaseClient);

// @riverpod
// FutureOr<User> currentUser(CurrentUserRef ref) => ref.read(authRepositoryProvider).getUser();

@Riverpod(keepAlive: true)
Stream<User?> currentUser(CurrentUserRef ref) {
  return ref.watch(
      authRepositoryProvider.select((value) => value.authStateChanges()));
}

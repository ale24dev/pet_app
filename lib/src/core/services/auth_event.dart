// file: auth_user.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.g.dart';

@Riverpod(keepAlive: true)
Stream<AuthState?> authStateSupabase(AuthStateSupabaseRef ref) async* {
  final authStream = Supabase.instance.client.auth.onAuthStateChange;

  await for (final authState in authStream) {
    yield authState;
  }
}

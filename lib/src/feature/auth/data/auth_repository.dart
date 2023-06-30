import 'package:pet_app/src/core/query_supabase.dart';
import 'package:pet_app/src/feature/auth/data/model/user_model.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class AuthRepository {
  AuthRepository({required this.supabaseClient});

  final supabase.SupabaseClient supabaseClient;

  final _authState = BehaviorSubject<User?>.seeded(null);

  Stream<User?> authStateChanges() => _authState.stream;

  User? get currentUser => _authState.value;

  void dispose() {
    _authState.close();
  }

  Future<User> login({required String email, required String password}) async {
    await supabaseClient.auth
        .signInWithPassword(email: email, password: password);

    final user = await getUser();

    return user;
  }

  Future<User> signup({required String email, required String password}) async {
    await supabaseClient.auth.signUp(email: email, password: password);

    final user = await getUser();

    return user;
  }

  Future<User?> logout() async {
    await supabaseClient.auth.signOut();
    return null;
  }

  Future<User> getUser() async {
    final userId = supabaseClient.auth.currentSession?.user.id ?? '0';
    final resp = await supabaseClient
        .from('user')
        .select(QuerySupabase.user)
        .eq('id', userId)
        .single();

    final User user = userModelFromMap(resp);
    _authState.value = user;

    return user;
  }
}

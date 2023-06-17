import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  const AuthRepository({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  Future<void> login({required String email, required String password}) async {
    final error = await supabaseClient.auth
        .signInWithPassword(email: email, password: password);
        print('error');
  }

  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }
}

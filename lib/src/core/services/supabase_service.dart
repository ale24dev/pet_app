import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SupabaseService{

  static SupabaseClient supabaseClient = Supabase.instance.client;
}
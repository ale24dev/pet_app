import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/query_supabase.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PetRepository {
  final SupabaseClient supabaseClient;
  const PetRepository({required this.supabaseClient});

  Future<ApiResult> getPetsOfUser() async {
    final apiResult = ApiResult();
    final userId = supabaseClient.auth.currentSession?.user.id ?? '0';
    final response = await supabaseClient
        .from('pet')
        .select(QuerySupabase.pet)
        .eq('user', userId);

    apiResult.responseObject = petFromJson(response);
    return apiResult;
  }
}

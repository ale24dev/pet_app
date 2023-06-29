import 'package:pet_app/src/core/api_result.dart';
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
        .select(
            'id, name, height, weight, age, birthday, description, color, gender, image, user(id, updated_at, username, full_name, avatar_url), pet_type(id, name), breed(id, name), pet_status(id, status, primary_status(id, status))')
        // .eq('user.id', userId);
        .eq('user', userId);

    apiResult.responseObject = petFromJson(response);
    return apiResult;
  }
}

import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/query_supabase.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';
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

  Future<bool> create(PetModel pet) async {
    await supabaseClient.from('pet').insert(pet.toJson());
    return true;
  }

  Future<bool> delete(int petId) async {
    await supabaseClient.from('pet').delete().eq('id', petId);
    return true;
  }

  Future<bool> add(Pet pet) async {
    final petJson = pet.toJson();
    await supabaseClient.from('pet').insert(petJson);
    return true;
  }

  Future<List<PetStatusModel>> getAllPetStatus() async {
   final response = await supabaseClient.from('pet_status').select();
    return petStatusFromJson(response);
  }

  Future<List<PetType>> getAllPetType() async {
   final response = await supabaseClient.from('pet_type').select();
    return petTypeFromJson(response);
  }
}

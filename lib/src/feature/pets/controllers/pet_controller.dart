import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/pets/data/pet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_controller.g.dart';

@riverpod
class PetController extends _$PetController{
  @override
  FutureOr<ApiResult> build(){
    return ref.watch(petRepositoryProvider).getPetsOfUser();
  }
}

@riverpod
PetRepository petRepository (PetRepositoryRef ref) {
  return PetRepository(supabaseClient: SupabaseService.supabaseClient);
}
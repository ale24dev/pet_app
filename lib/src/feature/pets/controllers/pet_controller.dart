import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/core/utils/riverpod.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';
import 'package:pet_app/src/feature/pets/data/pet_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_controller.g.dart';

@riverpod
class PetController extends _$PetController with SideEffect<ApiResult> {
  @override
  FutureOr<ApiResult> build() {
    return ref.watch(petRepositoryProvider).getPetsOfUser();
  }

  Future<bool> deletePet(int id) async {
    return mutation(
      mutation: () => ref.watch(petRepositoryProvider).delete(id),
    );
  }
  Future<bool> addPet(PetModel pet) async {
    return mutation(
      mutation: () => ref.watch(petRepositoryProvider).add(pet),
    );
  }
  
}

@riverpod
PetRepository petRepository(PetRepositoryRef ref) {
  return PetRepository(supabaseClient: SupabaseService.supabaseClient);
}


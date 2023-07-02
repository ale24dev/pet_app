import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_pet_controller.g.dart';

@riverpod
class ProfilePetController extends _$ProfilePetController {
  @override
  FutureOr<Pet> build(int id) {
    return ref.read(petRepositoryProvider).getById(id);
  }

  Future<bool> updatePet(Pet pet) async {
    try {
      state = const AsyncValue.loading();
      final success = await ref.read(petRepositoryProvider).update(pet);

      // AsyncValue.data(petResp);

      state = await AsyncValue.guard(() async => build(id));

      return success;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }
}

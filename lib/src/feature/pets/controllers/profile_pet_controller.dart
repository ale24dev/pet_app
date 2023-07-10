import 'package:pet_app/src/core/utils/riverpod.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_pet_controller.g.dart';

@riverpod
class ProfilePetController extends _$ProfilePetController
    with SideEffect<Pet, int> {
  @override
  FutureOr<Pet> build(id) {
    return ref.read(petRepositoryProvider).getById(id!);
  }

  Future<bool> updatePet(Pet pet) async {
    return mutation(
        param: id,
        mutation: () => ref.watch(petRepositoryProvider).update(pet));
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';

///Provider to get all status of pets
final petStatusProvider = FutureProvider.autoDispose<List<PetStatusModel>>((ref) async {
  return await ref.read(petRepositoryProvider).getAllPetStatus();
});


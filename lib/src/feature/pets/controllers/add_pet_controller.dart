import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';

///Provider to get all status of pets
final petStatusProvider = FutureProvider.autoDispose<List<PetStatusModel>>((ref) async {
  return await ref.read(petRepositoryProvider).getAllPetStatus();
});

///Provider to get all types of pets
final petTypeProvider = FutureProvider.autoDispose<List<PetType>>((ref) async {
  return await ref.read(petRepositoryProvider).getAllPetType();
});


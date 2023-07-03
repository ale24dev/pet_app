import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/favorites/data/favorite_repository.dart';
import 'package:pet_app/src/feature/favorites/data/model/favorite_model.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_controller.g.dart';

@riverpod
class FavoriteController extends _$FavoriteController {
  @override
  FutureOr<List<FavoriteModel>> build(String userId) async {
    final favoriteRepository = ref.watch(favoriteRepositoryProvider);

    return await favoriteRepository.getFavoritesByUser(userId);
  }

  Future<bool> addToFavorites({required Pet pet}) async {
    state = const AsyncValue.loading();
    try {
      final favoriteRepository = ref.read(favoriteRepositoryProvider);

      final success =
          await favoriteRepository.addPetToFav(userId: userId, pet: pet);

      if (success) {
        ref
            .read(checkPetInFavProvider(userId: userId, pet: pet).notifier)
            .refreshState();
      }

      state = await AsyncValue.guard(() async => build(userId));

      return success;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }

  Future<bool> removeOfFavorites({required Pet pet}) async {
    state = const AsyncValue.loading();
    try {
      final favoriteRepository = ref.read(favoriteRepositoryProvider);

      final success =
          await favoriteRepository.removePetOfFav(userId: userId, pet: pet);

      if (success) {
        ref
            .read(checkPetInFavProvider(userId: userId, pet: pet).notifier)
            .refreshState();
      }

      state = await AsyncValue.guard(() async => build(userId));

      return success;
    } catch (e, s) {
      state = AsyncError(e, s);
      return false;
    }
  }
}

@Riverpod(keepAlive: true)
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  return FavoriteRepository(supabaseClient: SupabaseService.supabaseClient);
}

@riverpod
class CheckPetInFav extends _$CheckPetInFav {
  @override
  FutureOr<bool> build({required String userId, required Pet pet}) async {
    return await ref
        .read(favoriteRepositoryProvider)
        .checkPetInFav(userId: userId, pet: pet);
  }

  Future<void> refreshState() async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async => build(pet: pet, userId: userId));
  }
}

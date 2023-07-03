import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/favorites/data/favorite_repository.dart';
import 'package:pet_app/src/feature/favorites/data/model/favorite_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_controller.g.dart';

@riverpod
class FavoriteController extends _$FavoriteController {
  @override
  FutureOr<List<FavoriteModel>> build(String userId) async {
    return ref.read(favoriteRepositoryProvider).getFavoritesByUser(userId);
  }
}

@Riverpod(keepAlive: true)
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref) {
  return FavoriteRepository(supabaseClient: SupabaseService.supabaseClient);
}
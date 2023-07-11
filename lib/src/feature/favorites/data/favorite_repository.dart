import 'package:pet_app/src/core/query_supabase.dart';
import 'package:pet_app/src/feature/favorites/data/model/favorite_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteRepository {
  final SupabaseClient supabaseClient;

  const FavoriteRepository({required this.supabaseClient});

  Future<List<FavoriteModel>> getFavoritesByUser(String userId) async {
    final response = await supabaseClient
        .from('favorite')
        .select(QuerySupabase.favorite)
        .eq('user', userId);

    final listFavorites = favoritesFromJson(response);

    return listFavorites;
  }
}

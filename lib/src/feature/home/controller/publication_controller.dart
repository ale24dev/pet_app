
import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/home/data/publication_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'publication_controller.g.dart';

@riverpod
class PublicationController extends _$PublicationController{
  @override
  FutureOr<ApiResult> build(){
    return ref.read(publicationRepositoryProvider).getAll();
  }
}

@Riverpod(keepAlive: true)
PublicationRepository publicationRepository(PublicationRepositoryRef ref) {
  return PublicationRepository(supabaseClient: SupabaseService.supabaseClient);
}

import 'package:pet_app/src/core/api_result.dart';
import 'package:pet_app/src/core/base_repository.dart';
import 'package:pet_app/src/core/query_supabase.dart';
import 'package:pet_app/src/feature/home/data/model/publication_model.dart';
import 'package:pet_app/src/feature/home/data/publication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PublicationRepository implements BaseRepository<Publication> {
  final SupabaseClient supabaseClient;

  const PublicationRepository({required this.supabaseClient});
  @override
  Future<ApiResult> delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }


  @override
  Future<ApiResult> getById(int id) async {
    ApiResult apiResult = ApiResult();
    final resp = await supabaseClient.from('publication').select('id, created_at, text, images, user(id, updated_at, username, full_name, avatar_url)').eq('id', id);
    // print();
    apiResult.responseObject = publicationFromJson(resp);
    return apiResult;
  }

  @override
  Future<ApiResult> insert(Publication value) async {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<ApiResult> update(Publication value) async {
    // TODO: implement update
    throw UnimplementedError();
  }
  
  @override
  Future<ApiResult> getAll() async{
     ApiResult apiResult = ApiResult();
    final resp = await supabaseClient.from('publication').select(QuerySupabase.publication);
    apiResult.responseObject = publicationFromJson(resp);
    return apiResult;
  }
}

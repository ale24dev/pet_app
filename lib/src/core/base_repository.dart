
import 'package:pet_app/src/core/api_result.dart';

abstract class BaseRepository<T> {

  ///Get <T> by id
  Future<ApiResult> getById(int id);

  ///Get <T> by id
  Future<ApiResult> getAll();

  ///Insert a <T> object to database
  Future<ApiResult> insert(T value);

  ///Update a <T> object
  Future<ApiResult> update(T value);

  ///Delete a <T> object
  Future<ApiResult> delete(int id);
}
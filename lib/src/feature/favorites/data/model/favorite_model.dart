// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';
import 'package:pet_app/src/feature/auth/data/model/user_model.dart';
import 'package:pet_app/src/feature/favorites/domain/favorite.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

List<FavoriteModel> favoritesFromJson(List<dynamic> str) =>
    str.map((x) => FavoriteModel.fromJson(x as Json)).toList();

@freezed
class FavoriteModel with _$FavoriteModel implements Favorite{
  const factory FavoriteModel(
      {required int id,
      required UserModel user,
      required PetModel pet,
      }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);
}

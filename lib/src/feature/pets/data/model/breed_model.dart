// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';

part 'breed_model.freezed.dart';
part 'breed_model.g.dart';

List<BreedModel> breedsFromJson(List<dynamic> str) =>
    str.map((x) => BreedModel.fromJson(x as Json)).toList();

@freezed
class BreedModel with _$BreedModel{
  const factory BreedModel(
      {required int id,
      required String name
      }) = _BreedModel;

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
}

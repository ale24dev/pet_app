// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';
import 'package:pet_app/src/feature/auth/data/model/user_model.dart';
import 'package:pet_app/src/feature/pets/data/model/breed_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';

part 'pet_model.freezed.dart';
part 'pet_model.g.dart';

enum Gender { MASCULINO, FEMENINO }

List<PetModel> petFromJson(List<dynamic> str) =>
    str.map((x) => PetModel.fromJson(x as Json)).toList();

@freezed
class PetModel with _$PetModel implements Pet {
  const factory PetModel({
    @JsonKey(includeIfNull: false) @Default(0) int? id,
    int? age,
    required String name,
    double? weight,
    double? height,
    DateTime? birthday,
    required String description,
    required String color,
    required String gender,
    String? image,
    required UserModel user,
    @JsonKey(name: 'pet_type') required PetType petType,
    @JsonKey(name: 'pet_status') required PetStatusModel petStatusModel,
    @JsonKey(name: 'breed') required BreedModel breedModel,
  }) = _PetModel;

  factory PetModel.fromJson(Map<String, dynamic> json) =>
      _$PetModelFromJson(json);
}

// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';

part 'pet_type.freezed.dart';
part 'pet_type.g.dart';

List<PetType> petTypeFromJson(List<dynamic> str) =>
    str.map((x) => PetType.fromJson(x as Json)).toList();

@freezed
class PetType with _$PetType {
  const factory PetType(
      {required int id,
      required String name
      // String? image,
      }) = _PetType;

  factory PetType.fromJson(Map<String, dynamic> json) =>
      _$PetTypeFromJson(json);
}

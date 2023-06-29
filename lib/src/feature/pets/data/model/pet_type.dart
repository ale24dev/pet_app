// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_type.freezed.dart';
part 'pet_type.g.dart';


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

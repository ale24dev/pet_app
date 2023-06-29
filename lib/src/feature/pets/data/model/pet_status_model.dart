// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_status_model.freezed.dart';
part 'pet_status_model.g.dart';

@freezed
class PetStatusModel with _$PetStatusModel {
  const factory PetStatusModel(
      {required int id,
      required String status,
      PrimaryStatus? primaryStatus
      }) = _PetStatusModel;

  factory PetStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PetStatusModelFromJson(json);
}

@freezed
class PrimaryStatus with _$PrimaryStatus{
  const factory PrimaryStatus(
      {required int id,
      required String status
      }) = _PrimaryStatus;

  factory PrimaryStatus.fromJson(Map<String, dynamic> json) =>
      _$PrimaryStatusFromJson(json);
}

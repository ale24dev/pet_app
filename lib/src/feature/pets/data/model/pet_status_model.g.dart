// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PetStatusModel _$$_PetStatusModelFromJson(Map<String, dynamic> json) =>
    _$_PetStatusModel(
      id: json['id'] as int,
      status: json['status'] as String,
      primaryStatus: json['primaryStatus'] == null
          ? null
          : PrimaryStatus.fromJson(
              json['primaryStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PetStatusModelToJson(_$_PetStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'primaryStatus': instance.primaryStatus,
    };

_$_PrimaryStatus _$$_PrimaryStatusFromJson(Map<String, dynamic> json) =>
    _$_PrimaryStatus(
      id: json['id'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_PrimaryStatusToJson(_$_PrimaryStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PetModel _$$_PetModelFromJson(Map<String, dynamic> json) => _$_PetModel(
      id: json['id'] as int,
      age: json['age'] as int?,
      name: json['name'] as String,
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
      description: json['description'] as String,
      color: json['color'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String?,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      petType: PetType.fromJson(json['pet_type'] as Map<String, dynamic>),
      petStatusModel:
          PetStatusModel.fromJson(json['pet_status'] as Map<String, dynamic>),
      breedModel: BreedModel.fromJson(json['breed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PetModelToJson(_$_PetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'birthday': instance.birthday?.toIso8601String(),
      'description': instance.description,
      'color': instance.color,
      'gender': instance.gender,
      'image': instance.image,
      'user': instance.user,
      'pet_type': instance.petType,
      'pet_status': instance.petStatusModel,
      'breed': instance.breedModel,
    };

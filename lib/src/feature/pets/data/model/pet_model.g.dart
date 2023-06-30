// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PetModel _$$_PetModelFromJson(Map<String, dynamic> json) => _$_PetModel(
      id: json['id'] as int? ?? 0,
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

Map<String, dynamic> _$$_PetModelToJson(_$_PetModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['age'] = instance.age;
  val['name'] = instance.name;
  val['weight'] = instance.weight;
  val['height'] = instance.height;
  val['birthday'] = instance.birthday?.toIso8601String();
  val['description'] = instance.description;
  val['color'] = instance.color;
  val['gender'] = instance.gender;
  val['image'] = instance.image;
  val['user'] = instance.user;
  val['pet_type'] = instance.petType;
  val['pet_status'] = instance.petStatusModel;
  val['breed'] = instance.breedModel;
  return val;
}

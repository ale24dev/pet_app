// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicationModel _$$_PublicationModelFromJson(Map<String, dynamic> json) =>
    _$_PublicationModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      text: json['text'] as String,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PublicationModelToJson(_$_PublicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'text': instance.text,
      'images': instance.images,
      'user': instance.user,
    };

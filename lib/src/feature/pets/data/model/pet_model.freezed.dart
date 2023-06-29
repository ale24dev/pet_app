// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return _PetModel.fromJson(json);
}

/// @nodoc
mixin _$PetModel {
  int get id => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  DateTime? get birthday => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'pet_type')
  PetType get petType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pet_status')
  PetStatusModel get petStatusModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'breed')
  BreedModel get breedModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetModelCopyWith<PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetModelCopyWith<$Res> {
  factory $PetModelCopyWith(PetModel value, $Res Function(PetModel) then) =
      _$PetModelCopyWithImpl<$Res, PetModel>;
  @useResult
  $Res call(
      {int id,
      int? age,
      String name,
      double? weight,
      double? height,
      DateTime? birthday,
      String description,
      String color,
      String gender,
      String? image,
      UserModel user,
      @JsonKey(name: 'pet_type') PetType petType,
      @JsonKey(name: 'pet_status') PetStatusModel petStatusModel,
      @JsonKey(name: 'breed') BreedModel breedModel});

  $UserModelCopyWith<$Res> get user;
  $PetTypeCopyWith<$Res> get petType;
  $PetStatusModelCopyWith<$Res> get petStatusModel;
  $BreedModelCopyWith<$Res> get breedModel;
}

/// @nodoc
class _$PetModelCopyWithImpl<$Res, $Val extends PetModel>
    implements $PetModelCopyWith<$Res> {
  _$PetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = freezed,
    Object? name = null,
    Object? weight = freezed,
    Object? height = freezed,
    Object? birthday = freezed,
    Object? description = null,
    Object? color = null,
    Object? gender = null,
    Object? image = freezed,
    Object? user = null,
    Object? petType = null,
    Object? petStatusModel = null,
    Object? breedModel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as PetType,
      petStatusModel: null == petStatusModel
          ? _value.petStatusModel
          : petStatusModel // ignore: cast_nullable_to_non_nullable
              as PetStatusModel,
      breedModel: null == breedModel
          ? _value.breedModel
          : breedModel // ignore: cast_nullable_to_non_nullable
              as BreedModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PetTypeCopyWith<$Res> get petType {
    return $PetTypeCopyWith<$Res>(_value.petType, (value) {
      return _then(_value.copyWith(petType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PetStatusModelCopyWith<$Res> get petStatusModel {
    return $PetStatusModelCopyWith<$Res>(_value.petStatusModel, (value) {
      return _then(_value.copyWith(petStatusModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BreedModelCopyWith<$Res> get breedModel {
    return $BreedModelCopyWith<$Res>(_value.breedModel, (value) {
      return _then(_value.copyWith(breedModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PetModelCopyWith<$Res> implements $PetModelCopyWith<$Res> {
  factory _$$_PetModelCopyWith(
          _$_PetModel value, $Res Function(_$_PetModel) then) =
      __$$_PetModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? age,
      String name,
      double? weight,
      double? height,
      DateTime? birthday,
      String description,
      String color,
      String gender,
      String? image,
      UserModel user,
      @JsonKey(name: 'pet_type') PetType petType,
      @JsonKey(name: 'pet_status') PetStatusModel petStatusModel,
      @JsonKey(name: 'breed') BreedModel breedModel});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $PetTypeCopyWith<$Res> get petType;
  @override
  $PetStatusModelCopyWith<$Res> get petStatusModel;
  @override
  $BreedModelCopyWith<$Res> get breedModel;
}

/// @nodoc
class __$$_PetModelCopyWithImpl<$Res>
    extends _$PetModelCopyWithImpl<$Res, _$_PetModel>
    implements _$$_PetModelCopyWith<$Res> {
  __$$_PetModelCopyWithImpl(
      _$_PetModel _value, $Res Function(_$_PetModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? age = freezed,
    Object? name = null,
    Object? weight = freezed,
    Object? height = freezed,
    Object? birthday = freezed,
    Object? description = null,
    Object? color = null,
    Object? gender = null,
    Object? image = freezed,
    Object? user = null,
    Object? petType = null,
    Object? petStatusModel = null,
    Object? breedModel = null,
  }) {
    return _then(_$_PetModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      petType: null == petType
          ? _value.petType
          : petType // ignore: cast_nullable_to_non_nullable
              as PetType,
      petStatusModel: null == petStatusModel
          ? _value.petStatusModel
          : petStatusModel // ignore: cast_nullable_to_non_nullable
              as PetStatusModel,
      breedModel: null == breedModel
          ? _value.breedModel
          : breedModel // ignore: cast_nullable_to_non_nullable
              as BreedModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PetModel implements _PetModel {
  const _$_PetModel(
      {required this.id,
      this.age,
      required this.name,
      this.weight,
      this.height,
      this.birthday,
      required this.description,
      required this.color,
      required this.gender,
      this.image,
      required this.user,
      @JsonKey(name: 'pet_type') required this.petType,
      @JsonKey(name: 'pet_status') required this.petStatusModel,
      @JsonKey(name: 'breed') required this.breedModel});

  factory _$_PetModel.fromJson(Map<String, dynamic> json) =>
      _$$_PetModelFromJson(json);

  @override
  final int id;
  @override
  final int? age;
  @override
  final String name;
  @override
  final double? weight;
  @override
  final double? height;
  @override
  final DateTime? birthday;
  @override
  final String description;
  @override
  final String color;
  @override
  final String gender;
  @override
  final String? image;
  @override
  final UserModel user;
  @override
  @JsonKey(name: 'pet_type')
  final PetType petType;
  @override
  @JsonKey(name: 'pet_status')
  final PetStatusModel petStatusModel;
  @override
  @JsonKey(name: 'breed')
  final BreedModel breedModel;

  @override
  String toString() {
    return 'PetModel(id: $id, age: $age, name: $name, weight: $weight, height: $height, birthday: $birthday, description: $description, color: $color, gender: $gender, image: $image, user: $user, petType: $petType, petStatusModel: $petStatusModel, breedModel: $breedModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PetModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.petType, petType) || other.petType == petType) &&
            (identical(other.petStatusModel, petStatusModel) ||
                other.petStatusModel == petStatusModel) &&
            (identical(other.breedModel, breedModel) ||
                other.breedModel == breedModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      age,
      name,
      weight,
      height,
      birthday,
      description,
      color,
      gender,
      image,
      user,
      petType,
      petStatusModel,
      breedModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PetModelCopyWith<_$_PetModel> get copyWith =>
      __$$_PetModelCopyWithImpl<_$_PetModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PetModelToJson(
      this,
    );
  }
}

abstract class _PetModel implements PetModel {
  const factory _PetModel(
      {required final int id,
      final int? age,
      required final String name,
      final double? weight,
      final double? height,
      final DateTime? birthday,
      required final String description,
      required final String color,
      required final String gender,
      final String? image,
      required final UserModel user,
      @JsonKey(name: 'pet_type')
          required final PetType petType,
      @JsonKey(name: 'pet_status')
          required final PetStatusModel petStatusModel,
      @JsonKey(name: 'breed')
          required final BreedModel breedModel}) = _$_PetModel;

  factory _PetModel.fromJson(Map<String, dynamic> json) = _$_PetModel.fromJson;

  @override
  int get id;
  @override
  int? get age;
  @override
  String get name;
  @override
  double? get weight;
  @override
  double? get height;
  @override
  DateTime? get birthday;
  @override
  String get description;
  @override
  String get color;
  @override
  String get gender;
  @override
  String? get image;
  @override
  UserModel get user;
  @override
  @JsonKey(name: 'pet_type')
  PetType get petType;
  @override
  @JsonKey(name: 'pet_status')
  PetStatusModel get petStatusModel;
  @override
  @JsonKey(name: 'breed')
  BreedModel get breedModel;
  @override
  @JsonKey(ignore: true)
  _$$_PetModelCopyWith<_$_PetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

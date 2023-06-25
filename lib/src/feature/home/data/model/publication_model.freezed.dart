// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) {
  return _PublicationModel.fromJson(json);
}

/// @nodoc
mixin _$PublicationModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicationModelCopyWith<PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationModelCopyWith<$Res> {
  factory $PublicationModelCopyWith(
          PublicationModel value, $Res Function(PublicationModel) then) =
      _$PublicationModelCopyWithImpl<$Res, PublicationModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String text,
      List<String>? images,
      UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$PublicationModelCopyWithImpl<$Res, $Val extends PublicationModel>
    implements $PublicationModelCopyWith<$Res> {
  _$PublicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? text = null,
    Object? images = freezed,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PublicationModelCopyWith<$Res>
    implements $PublicationModelCopyWith<$Res> {
  factory _$$_PublicationModelCopyWith(
          _$_PublicationModel value, $Res Function(_$_PublicationModel) then) =
      __$$_PublicationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      String text,
      List<String>? images,
      UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$_PublicationModelCopyWithImpl<$Res>
    extends _$PublicationModelCopyWithImpl<$Res, _$_PublicationModel>
    implements _$$_PublicationModelCopyWith<$Res> {
  __$$_PublicationModelCopyWithImpl(
      _$_PublicationModel _value, $Res Function(_$_PublicationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? text = null,
    Object? images = freezed,
    Object? user = null,
  }) {
    return _then(_$_PublicationModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PublicationModel implements _PublicationModel {
  const _$_PublicationModel(
      {required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      required this.text,
      final List<String>? images,
      required this.user})
      : _images = images;

  factory _$_PublicationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PublicationModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final String text;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel user;

  @override
  String toString() {
    return 'PublicationModel(id: $id, createdAt: $createdAt, text: $text, images: $images, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, text,
      const DeepCollectionEquality().hash(_images), user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicationModelCopyWith<_$_PublicationModel> get copyWith =>
      __$$_PublicationModelCopyWithImpl<_$_PublicationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicationModelToJson(
      this,
    );
  }
}

abstract class _PublicationModel implements PublicationModel {
  const factory _PublicationModel(
      {required final int id,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      required final String text,
      final List<String>? images,
      required final UserModel user}) = _$_PublicationModel;

  factory _PublicationModel.fromJson(Map<String, dynamic> json) =
      _$_PublicationModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  String get text;
  @override
  List<String>? get images;
  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$_PublicationModelCopyWith<_$_PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

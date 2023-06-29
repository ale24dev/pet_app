// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PetStatusModel _$PetStatusModelFromJson(Map<String, dynamic> json) {
  return _PetStatusModel.fromJson(json);
}

/// @nodoc
mixin _$PetStatusModel {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  PrimaryStatus? get primaryStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PetStatusModelCopyWith<PetStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetStatusModelCopyWith<$Res> {
  factory $PetStatusModelCopyWith(
          PetStatusModel value, $Res Function(PetStatusModel) then) =
      _$PetStatusModelCopyWithImpl<$Res, PetStatusModel>;
  @useResult
  $Res call({int id, String status, PrimaryStatus? primaryStatus});

  $PrimaryStatusCopyWith<$Res>? get primaryStatus;
}

/// @nodoc
class _$PetStatusModelCopyWithImpl<$Res, $Val extends PetStatusModel>
    implements $PetStatusModelCopyWith<$Res> {
  _$PetStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? primaryStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      primaryStatus: freezed == primaryStatus
          ? _value.primaryStatus
          : primaryStatus // ignore: cast_nullable_to_non_nullable
              as PrimaryStatus?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrimaryStatusCopyWith<$Res>? get primaryStatus {
    if (_value.primaryStatus == null) {
      return null;
    }

    return $PrimaryStatusCopyWith<$Res>(_value.primaryStatus!, (value) {
      return _then(_value.copyWith(primaryStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PetStatusModelCopyWith<$Res>
    implements $PetStatusModelCopyWith<$Res> {
  factory _$$_PetStatusModelCopyWith(
          _$_PetStatusModel value, $Res Function(_$_PetStatusModel) then) =
      __$$_PetStatusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String status, PrimaryStatus? primaryStatus});

  @override
  $PrimaryStatusCopyWith<$Res>? get primaryStatus;
}

/// @nodoc
class __$$_PetStatusModelCopyWithImpl<$Res>
    extends _$PetStatusModelCopyWithImpl<$Res, _$_PetStatusModel>
    implements _$$_PetStatusModelCopyWith<$Res> {
  __$$_PetStatusModelCopyWithImpl(
      _$_PetStatusModel _value, $Res Function(_$_PetStatusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? primaryStatus = freezed,
  }) {
    return _then(_$_PetStatusModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      primaryStatus: freezed == primaryStatus
          ? _value.primaryStatus
          : primaryStatus // ignore: cast_nullable_to_non_nullable
              as PrimaryStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PetStatusModel implements _PetStatusModel {
  const _$_PetStatusModel(
      {required this.id, required this.status, this.primaryStatus});

  factory _$_PetStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_PetStatusModelFromJson(json);

  @override
  final int id;
  @override
  final String status;
  @override
  final PrimaryStatus? primaryStatus;

  @override
  String toString() {
    return 'PetStatusModel(id: $id, status: $status, primaryStatus: $primaryStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PetStatusModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.primaryStatus, primaryStatus) ||
                other.primaryStatus == primaryStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status, primaryStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PetStatusModelCopyWith<_$_PetStatusModel> get copyWith =>
      __$$_PetStatusModelCopyWithImpl<_$_PetStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PetStatusModelToJson(
      this,
    );
  }
}

abstract class _PetStatusModel implements PetStatusModel {
  const factory _PetStatusModel(
      {required final int id,
      required final String status,
      final PrimaryStatus? primaryStatus}) = _$_PetStatusModel;

  factory _PetStatusModel.fromJson(Map<String, dynamic> json) =
      _$_PetStatusModel.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  PrimaryStatus? get primaryStatus;
  @override
  @JsonKey(ignore: true)
  _$$_PetStatusModelCopyWith<_$_PetStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PrimaryStatus _$PrimaryStatusFromJson(Map<String, dynamic> json) {
  return _PrimaryStatus.fromJson(json);
}

/// @nodoc
mixin _$PrimaryStatus {
  int get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrimaryStatusCopyWith<PrimaryStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrimaryStatusCopyWith<$Res> {
  factory $PrimaryStatusCopyWith(
          PrimaryStatus value, $Res Function(PrimaryStatus) then) =
      _$PrimaryStatusCopyWithImpl<$Res, PrimaryStatus>;
  @useResult
  $Res call({int id, String status});
}

/// @nodoc
class _$PrimaryStatusCopyWithImpl<$Res, $Val extends PrimaryStatus>
    implements $PrimaryStatusCopyWith<$Res> {
  _$PrimaryStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrimaryStatusCopyWith<$Res>
    implements $PrimaryStatusCopyWith<$Res> {
  factory _$$_PrimaryStatusCopyWith(
          _$_PrimaryStatus value, $Res Function(_$_PrimaryStatus) then) =
      __$$_PrimaryStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String status});
}

/// @nodoc
class __$$_PrimaryStatusCopyWithImpl<$Res>
    extends _$PrimaryStatusCopyWithImpl<$Res, _$_PrimaryStatus>
    implements _$$_PrimaryStatusCopyWith<$Res> {
  __$$_PrimaryStatusCopyWithImpl(
      _$_PrimaryStatus _value, $Res Function(_$_PrimaryStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_$_PrimaryStatus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrimaryStatus implements _PrimaryStatus {
  const _$_PrimaryStatus({required this.id, required this.status});

  factory _$_PrimaryStatus.fromJson(Map<String, dynamic> json) =>
      _$$_PrimaryStatusFromJson(json);

  @override
  final int id;
  @override
  final String status;

  @override
  String toString() {
    return 'PrimaryStatus(id: $id, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrimaryStatus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrimaryStatusCopyWith<_$_PrimaryStatus> get copyWith =>
      __$$_PrimaryStatusCopyWithImpl<_$_PrimaryStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrimaryStatusToJson(
      this,
    );
  }
}

abstract class _PrimaryStatus implements PrimaryStatus {
  const factory _PrimaryStatus(
      {required final int id, required final String status}) = _$_PrimaryStatus;

  factory _PrimaryStatus.fromJson(Map<String, dynamic> json) =
      _$_PrimaryStatus.fromJson;

  @override
  int get id;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_PrimaryStatusCopyWith<_$_PrimaryStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

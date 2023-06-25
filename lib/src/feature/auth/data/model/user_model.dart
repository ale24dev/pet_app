// To parse this JSON data, do
//
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel UserModelFromMap(String str) => UserModel.fromJson(json.decode(str));

// String UserModelToMap(UserModel data) => json.encode(data.());

@freezed
class UserModel with _$UserModel{
    const factory UserModel({
        required String id,
        @JsonKey(name: 'updated_at') required DateTime updatedAt,
        String? username,
        String? fullname,
        String? avatarUrl
    }) = _UserModel;

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

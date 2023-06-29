// To parse this JSON data, do
//
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:pet_app/src/feature/auth/data/user.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel UserModelFromMap(String str) => UserModel.fromJson(json.decode(str));

// String UserModelToMap(UserModel data) => json.encode(data.());

@freezed
class UserModel with _$UserModel implements User{
    const factory UserModel({
        required String id,
        @JsonKey(name: 'updated_at') required DateTime updatedAt,
        required String username,
        String? fullname,
        @JsonKey(name: 'avatar_url') required String avatarUrl
    }) = _UserModel;

    factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

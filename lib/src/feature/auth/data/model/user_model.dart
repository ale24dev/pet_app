// To parse this JSON data, do
//
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';

import 'package:pet_app/src/feature/auth/domain/user.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';

UserModel userModelFromMap(Json str) => UserModel.fromJson(str);

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

// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_app/src/core/extension.dart';
import 'package:pet_app/src/feature/auth/data/model/user_model.dart';

part 'publication_model.freezed.dart';
part 'publication_model.g.dart';

List<PublicationModel> productsFromJson(List<dynamic> str) => str.map((x) => PublicationModel.fromJson(x as Json)).toList();

// String PublicationModelToMap(PublicationModel data) => json.encode(data.());

@freezed
class PublicationModel with _$PublicationModel{
    const factory PublicationModel({
        required int id,
        @JsonKey(name: 'created_at') required DateTime createdAt,
        required String text,
        List<String>? images,
        UserModel? user
    }) = _PublicationModel;

    factory PublicationModel.fromJson(Map<String, dynamic> json) => _$PublicationModelFromJson(json);
}

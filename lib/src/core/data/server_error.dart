// To parse this JSON data, do
//
//     final serverError = serverErrorFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'server_error.freezed.dart';
part 'server_error.g.dart';

ServerError serverErrorFromMap(String str) => ServerError.fromJson(json.decode(str));

// String serverErrorToMap(ServerError data) => json.encode(data.());

@freezed
class ServerError with _$ServerError {
    const factory ServerError({
        String? message,
        int? statusCode,
    }) = _ServerError;

    factory ServerError.fromJson(Map<String, dynamic> json) => _$ServerErrorFromJson(json);
}


typedef LocalizedServerErrorResponse = ({String description, String? title});



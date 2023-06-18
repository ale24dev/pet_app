/// Class that stores the result of a service call.
class ApiResult<T> {
  /// Mapped response.
  T? responseObject;

  /// Status code of the response.
  int? statusCode;

  /// Error messages of the response.
  String? serverError;

  /// Messages of the response.
  String? message;

  /// Class constructor.
  ApiResult({this.responseObject, this.statusCode, this.serverError});

  ApiResult<T> copyWith({
    T? responseObject,
    int? statusCode,
    String? serverError,
    String? message,
  }) {
    return ApiResult<T>(
      responseObject: responseObject ?? this.responseObject,
      statusCode: statusCode ?? this.statusCode,
      serverError: serverError ?? this.serverError,
    );
  }
}
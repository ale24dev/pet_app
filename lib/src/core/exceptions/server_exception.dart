part of 'exceptions.dart';

/// An exception generated in an remote server
class ServerException implements AppException {
  final String _message;
  // final ServerErrorResponse? serverError;
  final int? status;

  const ServerException({String message = 'Unknown Server error', this.status})
      : _message = message;

  @override
  String get message =>  _message;

  @override
  String toString() {
    return 'ServerException{_message: $_message, status: $status}';
  }
}

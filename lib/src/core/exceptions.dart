/// Custom exception used with Http requests
class HttpException implements Exception {
  /// Creates a new instance of [HttpException]
  HttpException({
    this.title,
    this.message,
    this.statusCode,
  });

  /// Exception title
  final String? title;

  /// Exception message
  final String? message;

  /// Exception http response code
  final int? statusCode;
}

/// Base class from which all exceptions that are specific to the app should extend.
abstract class AppException implements Exception {
  final String? message;

  const AppException([this.message]);
}

/// Exception thrown when a provider which is supposed to be overridden was not.
/// See https://riverpod.dev/docs/cookbooks/testing#overriding-the-behavior-of-a-provider-during-tests
class ProviderNotOverriddenException implements Exception {
  final String message;

  ProviderNotOverriddenException({required String name}) : message = "The provider '$name' was not overridden'";
}

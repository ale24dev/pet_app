
part 'server_exception.dart';

/// Base class from which all exceptions that are specific to the app should extend.
sealed class AppException implements Exception {
  final String? message;

  const AppException([this.message]);
}

/// Exception thrown when a provider which is supposed to be overridden was not.
/// See https://riverpod.dev/docs/cookbooks/testing#overriding-the-behavior-of-a-provider-during-tests
class ProviderNotOverriddenException implements Exception {
  final String message;

  ProviderNotOverriddenException({required String name}) : message = "The provider '$name' was not overridden'";
}

class NavigationException<T> implements AppException {
  @override
  final String message;

  NavigationException({required String path})
      : message = 'GoRouter Route [$path] requires an extra parameter of type $T. '
            'Remember to pass an object of type $T : `context.go("$path",extra: object)` ';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$logoutControllerHash() => r'15e58a6fc27dc89f81487ac6253ef4c3b590f81c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LogoutController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final Null? param;

  Future<void> build(
    Null? param,
  );
}

/// See also [LogoutController].
@ProviderFor(LogoutController)
const logoutControllerProvider = LogoutControllerFamily();

/// See also [LogoutController].
class LogoutControllerFamily extends Family<AsyncValue<void>> {
  /// See also [LogoutController].
  const LogoutControllerFamily();

  /// See also [LogoutController].
  LogoutControllerProvider call(
    Null? param,
  ) {
    return LogoutControllerProvider(
      param,
    );
  }

  @override
  LogoutControllerProvider getProviderOverride(
    covariant LogoutControllerProvider provider,
  ) {
    return call(
      provider.param,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'logoutControllerProvider';
}

/// See also [LogoutController].
class LogoutControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<LogoutController, void> {
  /// See also [LogoutController].
  LogoutControllerProvider(
    this.param,
  ) : super.internal(
          () => LogoutController()..param = param,
          from: logoutControllerProvider,
          name: r'logoutControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$logoutControllerHash,
          dependencies: LogoutControllerFamily._dependencies,
          allTransitiveDependencies:
              LogoutControllerFamily._allTransitiveDependencies,
        );

  final Null? param;

  @override
  bool operator ==(Object other) {
    return other is LogoutControllerProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<void> runNotifierBuild(
    covariant LogoutController notifier,
  ) {
    return notifier.build(
      param,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

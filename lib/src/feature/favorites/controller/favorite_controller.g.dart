// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteRepositoryHash() =>
    r'c985a6f68031c2c0b1638363da83b8d5e34936ff';

/// See also [favoriteRepository].
@ProviderFor(favoriteRepository)
final favoriteRepositoryProvider = Provider<FavoriteRepository>.internal(
  favoriteRepository,
  name: r'favoriteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteRepositoryRef = ProviderRef<FavoriteRepository>;
String _$favoriteControllerHash() =>
    r'910c9cf4229a9597181ccf295b7fb2fede9ba1c6';

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

abstract class _$FavoriteController
    extends BuildlessAutoDisposeAsyncNotifier<List<FavoriteModel>> {
  late final String userId;

  FutureOr<List<FavoriteModel>> build(
    String userId,
  );
}

/// See also [FavoriteController].
@ProviderFor(FavoriteController)
const favoriteControllerProvider = FavoriteControllerFamily();

/// See also [FavoriteController].
class FavoriteControllerFamily extends Family<AsyncValue<List<FavoriteModel>>> {
  /// See also [FavoriteController].
  const FavoriteControllerFamily();

  /// See also [FavoriteController].
  FavoriteControllerProvider call(
    String userId,
  ) {
    return FavoriteControllerProvider(
      userId,
    );
  }

  @override
  FavoriteControllerProvider getProviderOverride(
    covariant FavoriteControllerProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'favoriteControllerProvider';
}

/// See also [FavoriteController].
class FavoriteControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FavoriteController, List<FavoriteModel>> {
  /// See also [FavoriteController].
  FavoriteControllerProvider(
    this.userId,
  ) : super.internal(
          () => FavoriteController()..userId = userId,
          from: favoriteControllerProvider,
          name: r'favoriteControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteControllerHash,
          dependencies: FavoriteControllerFamily._dependencies,
          allTransitiveDependencies:
              FavoriteControllerFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is FavoriteControllerProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<FavoriteModel>> runNotifierBuild(
    covariant FavoriteController notifier,
  ) {
    return notifier.build(
      userId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

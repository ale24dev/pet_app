// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_pet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profilePetControllerHash() =>
    r'014e866ae33b7d46b8a6a5984cb6f860d478ec92';

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

abstract class _$ProfilePetController
    extends BuildlessAutoDisposeAsyncNotifier<Pet> {
  late final int id;

  FutureOr<Pet> build(
    int id,
  );
}

/// See also [ProfilePetController].
@ProviderFor(ProfilePetController)
const profilePetControllerProvider = ProfilePetControllerFamily();

/// See also [ProfilePetController].
class ProfilePetControllerFamily extends Family<AsyncValue<Pet>> {
  /// See also [ProfilePetController].
  const ProfilePetControllerFamily();

  /// See also [ProfilePetController].
  ProfilePetControllerProvider call(
    int id,
  ) {
    return ProfilePetControllerProvider(
      id,
    );
  }

  @override
  ProfilePetControllerProvider getProviderOverride(
    covariant ProfilePetControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'profilePetControllerProvider';
}

/// See also [ProfilePetController].
class ProfilePetControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProfilePetController, Pet> {
  /// See also [ProfilePetController].
  ProfilePetControllerProvider(
    this.id,
  ) : super.internal(
          () => ProfilePetController()..id = id,
          from: profilePetControllerProvider,
          name: r'profilePetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profilePetControllerHash,
          dependencies: ProfilePetControllerFamily._dependencies,
          allTransitiveDependencies:
              ProfilePetControllerFamily._allTransitiveDependencies,
        );

  final int id;

  @override
  bool operator ==(Object other) {
    return other is ProfilePetControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Pet> runNotifierBuild(
    covariant ProfilePetController notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$petRepositoryHash() => r'48d7400a310d901658ba3658c25123a6c001b35f';

/// See also [petRepository].
@ProviderFor(petRepository)
final petRepositoryProvider = AutoDisposeProvider<PetRepository>.internal(
  petRepository,
  name: r'petRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PetRepositoryRef = AutoDisposeProviderRef<PetRepository>;
String _$petControllerHash() => r'4f8b551389a78e9fc31392a3d1038cbc3bbbdd96';

/// See also [PetController].
@ProviderFor(PetController)
final petControllerProvider = AutoDisposeAsyncNotifierProvider<PetController,
    ApiResult<dynamic>>.internal(
  PetController.new,
  name: r'petControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$petControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PetController = AutoDisposeAsyncNotifier<ApiResult<dynamic>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

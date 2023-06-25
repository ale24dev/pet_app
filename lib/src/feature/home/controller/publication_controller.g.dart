// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$publicationRepositoryHash() =>
    r'5eb3c2f5ec8a399e571fe6c2a7ba59e5ede4e8f9';

/// See also [publicationRepository].
@ProviderFor(publicationRepository)
final publicationRepositoryProvider = Provider<PublicationRepository>.internal(
  publicationRepository,
  name: r'publicationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$publicationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PublicationRepositoryRef = ProviderRef<PublicationRepository>;
String _$publicationControllerHash() =>
    r'5553c80bd64ec02bd6d746b68a14e0f2e58dc390';

/// See also [PublicationController].
@ProviderFor(PublicationController)
final publicationControllerProvider = AutoDisposeAsyncNotifierProvider<
    PublicationController, ApiResult<dynamic>>.internal(
  PublicationController.new,
  name: r'publicationControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$publicationControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PublicationController = AutoDisposeAsyncNotifier<ApiResult<dynamic>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

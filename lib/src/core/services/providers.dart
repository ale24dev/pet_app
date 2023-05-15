
import 'shared_preferences_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pet_app/src/core/exceptions.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
AppPreferencesService preferences(PreferencesRef ref) =>
    throw ProviderNotOverriddenException(name: 'storageProvider');

// @Riverpod()
// AuthFormNotifier authService(AuthServiceRef ref) => AuthFormNotifier(AuthForm());

// final authFormProvider = StateNotifierProvider((ref) => AuthFormNotifier(AuthForm()));
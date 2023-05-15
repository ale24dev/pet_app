import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shared_preferences_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pet_app/src/core/exceptions.dart';
import 'package:pet_app/src/core/services/auth_service.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
AppPreferencesService preferences(PreferencesRef ref) =>
    throw ProviderNotOverriddenException(name: 'storageProvider');

final authFormProvider = StateNotifierProvider((ref) => AuthFormNotifier(AuthForm()));
import 'package:pet_app/src/core/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences_storage_service.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
AppPreferencesService preferences(PreferencesRef ref) =>
    throw ProviderNotOverriddenException(name: 'storageProvider');

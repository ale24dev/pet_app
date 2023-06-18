import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/services/shared_preferences_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'src/app.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'src/core/services/providers.dart';

Future<void> main() async {
  // Ensure we have access to plugins
  WidgetsFlutterBinding.ensureInitialized();

  final providerOverrides = await overrideProviders();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
      url: dotenv.get('URL_SUPABASE'),
      anonKey: dotenv.get('ANNON_KEY_SUPABASE'));


  runApp(
    ProviderScope(
      overrides: providerOverrides,
      child: const MyApp(),
    ),
  );
}

Future<List<Override>> overrideProviders() async {
  final preferences = await SharedPreferences.getInstance();
  return [
    preferencesProvider
        .overrideWith((ref) => AppPreferencesService(preferences)),
  ];
}

import 'package:flutter/material.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pet_app/src/routes/app_router.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider());

    final theme = AppTheme();
    return MaterialApp.router(
      title: 'Pet Care',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: ThemeMode.light,
      routerConfig: goRouter,
    );
  }
}

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
  void initState() {
    super.initState();

    // / Listen for authentication events and redirect to
    // / correct page when key events are detected.
    // Supabase.instance.client.auth.onAuthStateChange.listen((authState) {
    //   final event = authState.event;
    //   final session = authState.session;
    //   if (event == AuthChangeEvent.signedIn) {
    //     if (session != null) {

    //       // _appRouter
    //       //   ..popUntilRoot()
    //       //   ..replae(HomeRoute(user: session.user));
    //     } else {
    //       // getIt<AuthRepository>().signOut();
    //     }
    //   } else if (event == AuthChangeEvent.signedOut) {
    //     // _appRouter
    //     //   ..popUntilRoot()
    //     //   ..replace(const SignInRoute());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider());

    final theme = AppTheme();
    // init();
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

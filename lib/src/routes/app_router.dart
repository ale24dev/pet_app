import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/src/core/services/auth_event.dart';
import 'package:pet_app/src/feature/auth/login_screen.dart';
import 'package:pet_app/src/feature/auth/signup_screen.dart';
import 'package:pet_app/src/feature/layout/layout_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pet_app/src/core/services/providers.dart';
import 'package:pet_app/src/core/widgets/not_found_screen.dart';
import 'package:pet_app/src/feature/onboarding/onboarding_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'custom_pages.dart';

part 'app_router.g.dart';

enum AppRoute {
  // Unauthenticated routes
  splash,
  onboarding,
  loginOrSignup,
  login,
  signUp,
  // Authenticated routes
  home,
  layout
}

@Riverpod(keepAlive: true)
// ignore: unsupported_provider_value
GoRouter goRouter(GoRouterRef ref, {String? initialLocation}) {
  final appPreferences = ref.watch(preferencesProvider);
  final screen = ref.watch(authStateSupabaseProvider).when(
    data: (authState) {
      print(authState!.event);
      if (authState.event == supabase.AuthChangeEvent.signedIn) {
        return '/${AppRoute.layout.name}';
      }
      if (authState.event == supabase.AuthChangeEvent.signedOut) {
        return '/${AppRoute.signUp.name}';
      }
      //context.goNamed(AppRoute.layout.name);
    },
    error: (error, stackTrace) {
      print(error.toString());
    },
    loading: () {
      print('Loading...');
    },
  );

  return GoRouter(
    initialLocation: screen ?? ((appPreferences.isFirstOpen()) ? '/onboard' : '/layout'),
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) {
      if (appPreferences.isFirstOpen()) return '/onboard';

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => const AllRoutesScreen(),
        routes: [
          GoRoute(
            path: 'splash',
            name: AppRoute.splash.name,
            pageBuilder: (context, state) => adaptivePageRoute(
              key: state.pageKey,
              child: NotFoundScreen.unimplemented(name: state.location),
            ),
          ),
          GoRoute(
            path: 'onboard',
            name: AppRoute.onboarding.name,
            pageBuilder: (context, state) => adaptivePageRoute(
              key: state.pageKey,
              child: const OnboardingScreen(),
            ),
          ),
          GoRoute(
            path: 'loginOrSignup',
            name: AppRoute.loginOrSignup.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: NotFoundScreen.unimplemented(name: state.location),
            ),
          ),
          GoRoute(
            path: 'login',
            name: AppRoute.login.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LoginScreen(),
            ),
          ),
          GoRoute(
            path: 'signup',
            name: AppRoute.signUp.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const SignupScreen(),
            ),
          ),
          GoRoute(
            path: 'layout',
            name: AppRoute.layout.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LayoutScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}

class AllRoutesScreen extends StatelessWidget {
  const AllRoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: AppRoute.values.length,
        itemBuilder: (c, i) {
          final route = AppRoute.values[i].name;
          return ListTile(
            title: Text(route),
            onTap: () {
              context.goNamed(route);
            },
          );
        },
      ),
    );
  }
}

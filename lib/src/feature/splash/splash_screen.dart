import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/routes/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    final session = SupabaseService.supabaseClient.auth.currentSession;

    if (session != null) {
      context.goNamed(AppRoute.layout.name);
    } else {
      context.goNamed(AppRoute.login.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

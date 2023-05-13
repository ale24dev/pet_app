import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:material_playground/material_playground.dart';

// ignore: missing_provider_scope
void main() => runApp(const DemoApp());

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode themeMode = ThemeMode.system;

  void _changeThemeMode(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Theme Playground',
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: themeMode,
      home: MaterialPlayground(themeMode: themeMode, onThemeModeChanged: _changeThemeMode),
    );
  }
}

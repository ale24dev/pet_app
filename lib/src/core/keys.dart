import 'package:flutter/foundation.dart';

/// Keys are declared in this class in order to have a single source of truth between the app UI and the tests

typedef K = AppKeys;

class AppKeys {
  const AppKeys();

  static const splashScreen = Key('splash-screen');
  static const onboardScreen = Key('onboarding-screen');
}

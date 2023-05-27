import 'package:flutter/material.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

import 'package:pet_app/resources/pet_icon.dart';
import 'package:pet_app/src/core/keys.dart';
import 'package:pet_app/src/core/services/navigation_bar_service.dart';

NavigationBar navigationBar(
    {required BuildContext context,
    required WidgetRef ref,
    required int indexSelected}) {
  final destinations = [
    NavigationDestination(
      icon: const Icon(PetIcon.home_1),
      selectedIcon: const Icon(PetIcon.home_1, color: AppColor.primary),
      label: context.l10n.navigationBarHome,
    ),
    NavigationDestination(
      icon: const Icon(PetIcon.pets),
      selectedIcon: const Icon(PetIcon.pets, color: AppColor.primary),
      label: context.l10n.navigationBarPets,
    ),
    NavigationDestination(
      icon: const Icon(Icons.settings),
      selectedIcon: const Icon(PetIcon.cog, color: AppColor.primary),
      label: context.l10n.navigationBarSettings,
    ),
  ];
  return NavigationBar(
      key: K.navBar,
      onDestinationSelected: (value) {
        ref.read(navigationBarServiceProvider.notifier).changeSelection(value);
      },
      selectedIndex: indexSelected,
      destinations: destinations);
}

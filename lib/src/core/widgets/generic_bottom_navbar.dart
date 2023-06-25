import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/resources/pet_icon.dart';
import 'package:pet_app/src/core/services/navbar_service.dart';

class GenericBottomNavbar extends ConsumerWidget {
  const GenericBottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarController = ref.watch(navbarControllerProvider);
    return BottomNavigationBar(
      onTap: (value) {
        ref.read(navbarControllerProvider.notifier).selectBottomNavItem(value);
      },
      currentIndex: navbarController.index,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(
            PetIcon.home_1,
          ),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
            icon: const Icon(PetIcon.pets), label: context.l10n.pet),
        BottomNavigationBarItem(
            icon: const Icon(PetIcon.shop), label: context.l10n.shop),
      ],
    );
  }
}

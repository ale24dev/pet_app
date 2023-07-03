import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/resources/assets.dart';
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
          icon: SvgPicture.asset(
            AppAsset.home,
          ),
          activeIcon: SvgPicture.asset(
            AppAsset.homeSolid,
            color: Theme.of(context).primaryColor,
          ),
          label: context.l10n.home,
        ),
        BottomNavigationBarItem(
            icon: const Icon(PetIcon.pet),
            activeIcon: const Icon(PetIcon.petSolid),
            label: context.l10n.pet),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAsset.heart),
            activeIcon: SvgPicture.asset(
              AppAsset.heartSolid,
              color: Theme.of(context).primaryColor,
            ),
            label: context.l10n.drawerScreenFavorites),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/src/core/services/navbar_service.dart';
import 'package:pet_app/src/core/utils.dart';
import 'package:pet_app/src/core/widgets/generic_bottom_navbar.dart';
import 'package:pet_app/src/core/widgets/generic_profile_image.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';

class LayoutScreen extends ConsumerWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navbarController = ref.watch(navbarControllerProvider);
    final currentUser = ref.watch(currentUserProvider).value;
    return Scaffold(
      appBar: navbarController.index == 0
          ? AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  ///This is for test
                  ref.read(authControllerProvider.notifier).logout();
                },
              ),
              actions: [
                GenericProfileImage(
                    image: currentUser?.avatarUrl ??
                        Constants.DEFAULT_PROFILE_IMAGE),

                // _ActionIconButtons(icon: Icon(Icons.search)),
                // _ActionIconButtons(icon: Icon(Icons.notifications_outlined)),
                const SizedBox.square(
                  dimension: 10,
                )
              ],
            )
          : null,
      body: Utils.getLayoutFromNavbarItem(navbarController.navbarItem),
      bottomNavigationBar: const GenericBottomNavbar(),
    );
  }
}

class _ActionIconButtons extends StatelessWidget {
  const _ActionIconButtons({
    required this.icon,
  });

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(11, 0, 0, 0),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: icon,
          )),
    );
  }
}

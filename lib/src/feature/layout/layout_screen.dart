import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/core/services/navbar_service.dart';
import 'package:pet_app/src/core/utils.dart';
import 'package:pet_app/src/core/widgets/avatar_user_image.dart';
import 'package:pet_app/src/core/widgets/generic_bottom_navbar.dart';
import 'package:pet_app/src/core/widgets/pet_settings_tile.dart';
import 'package:pet_app/src/core/widgets/widget_extensions.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/home/home_screen.dart';
import 'package:pet_app/src/feature/layout/widgets/drawer_home.dart';
import 'package:pet_app/src/feature/layout/widgets/signout_pop.dart';
import 'package:pet_app/src/feature/profile/controller/profile_controller.dart';

class LayoutScreen extends ConsumerStatefulWidget {
  const LayoutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends ConsumerState<LayoutScreen> {
  ///Info of position to control to drawer
  bool isDrawerOpen = false;
  double xOffset = 0;
  double yOffset = 0;

  @override
  Widget build(BuildContext context) {
    final navbarController = ref.watch(navbarControllerProvider);
    final authController = ref.watch(authControllerProvider);

    final currentPage = Utils.getLayoutFromNavbarItem(
        navbarItem: navbarController.navbarItem,
        isDrawerOpen: isDrawerOpen,
        xOffset: xOffset,
        yOffset: yOffset);

    return Scaffold(
      appBar: navbarController.index == 0
          ? AppBar(
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  isDrawerOpen
                      ? setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          isDrawerOpen = false;
                        })
                      : setState(() {
                          xOffset = 290;
                          yOffset = 80;
                          isDrawerOpen = true;
                        });
                },
              ),
              actions: [
                // We use a builder so we pass the context of the closest parent to the popup.
                // This is necessary to correctly position the popup
                AsyncValueWidget(
                  value: authController,
                  data: (currentUser) {
                    return Builder(
                      builder: (context) {
                        return InkWell(
                          onTap: () {
                            showSignOutPopup(context, currentUser.user!, ref);
                          },
                          child: const AvatarUserImage(),
                        );
                      },
                    );
                  },
                ),
                const SizedBox.square(
                  dimension: 20,
                )
              ],
            )
          : null,
      body: currentPage is HomeScreen
          ? DrawerHome(
              isDrawerOpen: isDrawerOpen,
              xOffset: xOffset,
              yOffset: yOffset,
              homePage: currentPage,
            )
          : currentPage,
      bottomNavigationBar: const GenericBottomNavbar(),
    );
  }
}

class LogoutSettingTile extends ConsumerWidget {
  final EdgeInsets? contentPadding;
  final ValueSetter<bool>? onLogout;

  const LogoutSettingTile({
    super.key,
    this.contentPadding,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoutController = ref.watch(logoutControllerProvider);
    return PetSettingsTile(
      contentPadding: contentPadding,
      leading: logoutController
          .maybeMap(
            loading: (_) => const SizedBox.square(
                dimension: 20, child: CircularProgressIndicator()),
            orElse: () => const Icon(Icons.logout),
          )
          .animatedSwitch(),
      title: Text(context.l10n.profileScreenLogout),
      onTap: () async {
        final didLogout =
            await ref.read(logoutControllerProvider.notifier).logout();

        onLogout?.call(didLogout);
        if (context.mounted) {
          final logoutText = didLogout
              ? context.l10n.profileScreenLogoutSuccess
              : context.l10n.profileScreenLogoutError;

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(logoutText)));
        }
      },
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

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/resources/pet_icon.dart';
import 'package:pet_app/src/core/widgets/async_value.dart';
import 'package:pet_app/src/core/widgets/avatar_user_image.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';

class DrawerHome extends ConsumerWidget {
  const DrawerHome({
    super.key,
    required this.xOffset,
    required this.yOffset,
    required this.isDrawerOpen,
    required this.homePage,
  });
  final double xOffset;
  final double yOffset;
  final bool isDrawerOpen;
  final Widget homePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);
    return Stack(
      children: [
        Padding(
          padding: context.responsiveContentPadding.copyWith(left: 25, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AsyncValueWidget(
                  value: authController,
                  data: (currentUser) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AvatarUserImage(imageRadius: 40),
                        const SizedBox.square(
                          dimension: 10,
                        ),
                        Text(
                          currentUser.user!.username,
                          style: AppTextStyle().drawerUsername,
                        )
                      ],
                    );
                  }),
              const SizedBox.square(
                dimension: 20,
              ),
              ListTile(
                leading: SvgPicture.asset(AppAsset.profile),
                title: Text(context.l10n.drawerScreenMyProfile),
              ),
              ListTile(
                leading: const Icon(PetIcon.pet),
                title: Text(context.l10n.drawerScreenMyPets),
              ),
              ListTile(
                leading: SvgPicture.asset(AppAsset.heart),
                title: Text(context.l10n.drawerScreenFavorites),
              ),
              const Spacer(),
              ListTile(
                leading: SvgPicture.asset(AppAsset.logout),
                title: Text(context.l10n.drawerScreenLogout),
              ),
              const SizedBox.square(
                dimension: 20,
              ),
            ],
          ),
        ),
        homePage
      ],
    );
  }
}

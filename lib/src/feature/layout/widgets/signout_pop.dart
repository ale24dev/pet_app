import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/src/core/utils/positioning.dart';
import 'package:pet_app/src/core/widgets/avatar_user_image.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:pet_app/src/feature/layout/layout_screen.dart';
import 'package:pet_app/src/routes/app_router.dart';

/// Displays a popup with the current user data and options to logout or delete its account
Future<void> showSignOutPopup(BuildContext context, User user, WidgetRef ref) {
  return showMenu(
    context: context,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    constraints: const BoxConstraints(minWidth: 250),
    position: rectFromContext(context),
    items: <PopupMenuEntry<void>>[
      PopupMenuItem(
        onTap: () {
          //TODO: Go to profile screen
          // context.goNamed(AppRoute.profile.name);
        },
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            const AvatarUserImage(),
            const SizedBox.square(dimension: 12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username,
                    // style: AppTextStyle().popupName,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem(
        height: 0,
        child: LogoutSettingTile(
          onLogout: (success) {
            if (context.mounted) {
              Navigator.pop(context, success);
              context.goNamed(AppRoute.login.name);
            }
          },
          contentPadding: const EdgeInsets.only(left: 12, right: 16),
        ),
      ),
    ],
  );
}

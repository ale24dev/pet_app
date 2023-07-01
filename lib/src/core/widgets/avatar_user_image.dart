import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/src/core/widgets/async_value.dart';
import 'package:pet_app/src/core/widgets/generic_profile_image.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';

class AvatarUserImage extends ConsumerWidget {
  const AvatarUserImage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider);

    return AsyncValueWidget(
        value: authController,
        data: (currentUser) {
          return GenericProfileImage(
              image: currentUser.user == null
                  ? Constants.DEFAULT_PROFILE_IMAGE
                  : currentUser.user!.avatarUrl);
        });
  }
}
  
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/core/widgets/empty_data.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/favorites/controller/favorite_controller.dart';
import 'package:pet_app/src/feature/favorites/widgets/favorite_card.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider);
    return Stack(
      children: [
        AsyncValueWidget(
          value: authController,
          data: (currentUser) {
            final favoriteController =
                ref.watch(favoriteControllerProvider(currentUser.user!.id));
            return AsyncValueWidget(
              value: favoriteController,
              data: (favorites) {
                return favorites.isEmpty
                    ? const EmptyData(
                        image: AppAsset.petFav,
                      )
                    : ListView.builder(
                        itemCount: favorites.length,
                        itemBuilder: (context, index) {
                          final favorite = favorites[index];
                          return FavoriteCard(favorite: favorite);
                        },
                      );
              },
            );
          },
        ),
      ],
    );
  }
}


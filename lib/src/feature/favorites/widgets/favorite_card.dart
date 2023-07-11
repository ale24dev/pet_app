import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/src/core/widgets/async_value.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/favorites/controller/favorite_controller.dart';
import 'package:pet_app/src/feature/favorites/data/model/favorite_model.dart';

class FavoriteCard extends ConsumerStatefulWidget {
  const FavoriteCard({super.key, required this.favorite});

  final FavoriteModel favorite;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends ConsumerState<FavoriteCard> {
  bool? isInFav;

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(authControllerProvider).value;
    final isInFavController = ref.watch(checkPetInFavProvider(
        userId: currentUser!.user!.id, pet: widget.favorite.pet));

    return Padding(
      padding: context.responsiveContentPadding.copyWith(top: 5, bottom: 5),
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: AppTheme.defaultRadius,
              color: Colors.white,
              boxShadow: AppTheme.shortShadow),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Image.asset(AppAsset.dog),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.favorite.pet.name,
                      style: AppTextStyle().body.copyWith(fontSize: 16),
                    ),
                    Text(
                      widget.favorite.pet.breedModel.name,
                      style: AppTextStyle().body.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                isInFav != null
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            if (isInFav!) {
                              ref
                                  .read(favoriteControllerProvider(
                                          currentUser.user!.id)
                                      .notifier)
                                  .removeOfFavorites(pet: widget.favorite.pet);
                            } else {
                              ref
                                  .read(favoriteControllerProvider(
                                          currentUser.user!.id)
                                      .notifier)
                                  .addToFavorites(pet: widget.favorite.pet);
                            }
                            isInFav = !isInFav!;
                          });
                        },
                        child: SvgPicture.asset(
                          AppAsset.heartSolid,
                          color: isInFav! ? Colors.red : null,
                        ),
                      )
                    : AsyncValueWidget(
                        value: isInFavController,
                        data: (isInFav) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            setState(() {
                              this.isInFav = isInFav;
                            });
                          });

                          return const SizedBox.shrink();
                        },
                      ),
              ],
            ),
          )),
    );
  }
}

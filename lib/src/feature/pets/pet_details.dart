import 'package:app_theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/favorites/controller/favorite_controller.dart';
import 'package:pet_app/src/feature/pets/add_or_edit_pet_form_model.dart';
import 'package:pet_app/src/feature/pets/controllers/profile_pet_controller.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_detail_box.dart';
import 'package:pet_app/src/widgets/generic_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PetDetails extends ConsumerWidget {
  const PetDetails({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilePetController =
        ref.watch(profilePetControllerProvider(pet.id!));
    return Scaffold(
      body: AsyncValueWidget(
        value: profilePetController,
        data: (pet) {
          return SizedBox(
            height: context.heightPx,
            child: Stack(
              children: [
                _HeaderDetails(pet: pet),
                _FooterDetails(
                  pet: pet,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FooterDetails extends ConsumerStatefulWidget {
  const _FooterDetails({required this.pet});

  final Pet pet;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FooterDetailsState();
}

class _FooterDetailsState extends ConsumerState<_FooterDetails> {
  bool? isInFav;
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.read(authControllerProvider).value;
    final isInFavController = ref.watch(
        checkPetInFavProvider(userId: currentUser!.user!.id, pet: widget.pet));

    ///Refresh state if occurs an error
    ref.listen(
      favoriteControllerProvider(currentUser.user!.id),
      (_, state) {
        setState(() {
          if (!state.isLoading && state.hasError) {
            state.showSnackbarOnError(context);
            setState(() {
              isInFav = !isInFav!;
            });
          }
        });
      },
    );
    return Positioned(
      top: context.heightPx * .47,
      left: 0,
      right: 0,
      child: SizedBox(
        height: context.heightPx,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Padding(
            padding:
                context.responsiveContentPadding.copyWith(left: 25, top: 0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pet.name,
                      style: AppTextStyle().petDetailsName,
                    ),
                    isInFav != null
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                if (isInFav!) {
                                  ref
                                      .read(favoriteControllerProvider(
                                              currentUser.user!.id)
                                          .notifier)
                                      .removeOfFavorites(pet: widget.pet);
                                } else {
                                  ref
                                      .read(favoriteControllerProvider(
                                              currentUser.user!.id)
                                          .notifier)
                                      .addToFavorites(pet: widget.pet);
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
                Text(
                  widget.pet.breedModel.name,
                  style: AppTextStyle().petDetailsBreed,
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PetDetailBox(
                        title: context.l10n.addPetScreenAge,
                        description: widget.pet.age?.toString() ?? '?'),
                    PetDetailBox(
                        title: context.l10n.addPetScreenGender,
                        description: widget.pet.gender),
                    PetDetailBox(
                        title: context.l10n.addPetScreenColor,
                        description: widget.pet.color),
                    PetDetailBox(
                        title: context.l10n.addPetScreenWeight,
                        description: widget.pet.weight != null
                            ? '${widget.pet.weight} kg'
                            : '?'),
                  ],
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                Text(
                  widget.pet.description,
                  style: AppTextStyle().petDetailsDescription,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderDetails extends StatelessWidget {
  const _HeaderDetails({required this.pet});

  final Pet pet;

  void showAddPetBottomSheet(
    BuildContext context,
  ) {
    // ignore: inference_failure_on_function_invocation
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.62,
        maxChildSize: 0.65,
        minChildSize: 0.2,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              width: double.infinity,
              child: AddOrEditPetFormModel(edit: true, pet: pet),
            ),
          );
        },
      ),
    );
  }

  showQRDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Codigo QR')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 130,
                  width: 150,
                  child: Center(
                    child: QrImageView(
                      data: pet.id.toString(),
                      version: QrVersions.auto,
                      size: 150.0,
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(
                          150,
                          150,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GenericButton(
                          widget: Text(context.l10n.accept),
                          onPressed: () {
                            context.pop();
                          }),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: context.heightPx * .5,
      width: double.infinity,
      child: Stack(
        children: [
          pet.hasImage
              ? CachedNetworkImage(
                  imageUrl: pet.image!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const _NoPetImage(),
                )
              : Center(
                  child: Image.asset(
                  AppAsset.noImage,
                  height: 100,
                )),
          Positioned(
            top: 60,
            left: 30,
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      boxShadow: AppTheme.shortShadow,
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios_outlined, size: 22),
                  )),
            ),
          ),
          Positioned(
            top: 60,
            right: 30,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    showQRDialog(context);
                  },
                  child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          boxShadow: AppTheme.shortShadow,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppAsset.qr),
                      )),
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                InkWell(
                  onTap: () {
                    showAddPetBottomSheet(context);
                  },
                  child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          boxShadow: AppTheme.shortShadow,
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppAsset.edit),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NoPetImage extends StatelessWidget {
  const _NoPetImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAsset.noImage);
  }
}

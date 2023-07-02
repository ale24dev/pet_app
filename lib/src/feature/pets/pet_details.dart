import 'package:app_theme/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_detail_box.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.heightPx,
        child: Stack(
          children: [
            _HeaderDetails(pet: pet),
            _FooterDetails(
              pet: pet,
            )
          ],
        ),
      ),
    );
  }
}

class _FooterDetails extends StatelessWidget {
  const _FooterDetails({required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
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
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pet.name,
                      style: AppTextStyle().petDetailsName,
                    ),
                    SvgPicture.asset(
                      AppAsset.heartSolid,
                      color: Colors.red,
                    )
                  ],
                ),
                Text(
                  pet.breedModel.name,
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
                        description: pet.age.toString()),
                    PetDetailBox(
                        title: context.l10n.addPetScreenGender,
                        description: pet.gender),
                    PetDetailBox(
                        title: context.l10n.addPetScreenColor,
                        description: pet.color),
                    PetDetailBox(
                        title: context.l10n.addPetScreenWeight,
                        description:
                            pet.weight != null ? '${pet.weight} kg' : '?'),
                  ],
                ),
                const SizedBox.square(
                  dimension: 20,
                ),
                Text(
                  pet.description,
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
              : Image.asset(AppAsset.noImage),
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
                Container(
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
                const SizedBox.square(
                  dimension: 8,
                ),
                Container(
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

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: Theme.of(context).cardTheme.shape!,
        shadows: AppTheme.defaultShadow,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(AppAsset.dog),
                const SizedBox.square(
                  dimension: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pet.name,
                      style: AppTextStyle().body.copyWith(fontSize: 16),
                    ),
                    Text(
                      pet.breedModel.name,
                      style: AppTextStyle().body.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }
}

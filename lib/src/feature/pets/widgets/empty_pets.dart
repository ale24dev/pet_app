import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

class EmptyPets extends StatelessWidget {
  const EmptyPets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAsset.petsEmpty,
              height: 250,
            ),
            const SizedBox.square(
              dimension: 4,
            ),
            SizedBox(
                width: context.widthPx * .6,
                child: Text(
                  context.l10n.addPetScreenDontHavePets,
                  textAlign: TextAlign.center,
                )),
            const SizedBox.square(
              dimension: 4,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(context.l10n.addPetScreenAdoptPet))
          ],
        ),
      );
  }
}

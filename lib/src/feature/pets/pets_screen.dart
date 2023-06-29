import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_card.dart';

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petController = ref.watch(petControllerProvider);
    return Stack(
      children: [
        AsyncValueWidget(
          value: petController,
          data: (apiResultPets) {
            return Padding(
              padding: context.responsiveContentPadding,
              child: ListView.builder(
                itemCount: apiResultPets.responseObject.length,
                itemBuilder: (context, index) {
                  final pet = apiResultPets.responseObject[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: ShapeDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: Theme.of(context).cardTheme.shape!,
                    ),
                    child: Dismissible(
                        key: ValueKey('pet-dissmisible-${pet.id}'),
                        direction: DismissDirection.endToStart,
                        secondaryBackground: const Padding(
                          padding: EdgeInsets.only(right: 13),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                height: 18,
                                width: 20,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        background: DecoratedBox(
                          decoration: ShapeDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: Theme.of(context).cardTheme.shape!,
                            shadows: AppTheme.defaultShadow,
                          ),
                          child: const SizedBox.shrink(),
                        ),
                        child: PetCard(pet: pet)),
                  );
                },
              ),
            );
          },
        ),
        Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}

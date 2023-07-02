import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/feature/pets/add_or_edit_pet_form_model.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/widgets/empty_pets.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_card.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/widgets/generic_button.dart';

class PetsScreen extends ConsumerWidget {
  const PetsScreen({super.key});

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
            child: const SizedBox(
              width: double.infinity,
              child: AddOrEditPetFormModel(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final petController = ref.watch(petControllerProvider);
    return Stack(
      children: [
        AsyncValueWidget(
          value: petController,
          data: (apiResultPets) {
            return AnimatedSwitcher(
              duration: 250.ms,
              child: apiResultPets.responseObject.isEmpty
                  ? const EmptyPets()
                  : Padding(
                      padding: context.responsiveContentPadding,
                      child: ListView.builder(
                        itemCount: apiResultPets.responseObject.length,
                        itemBuilder: (context, index) {
                          final pet = apiResultPets.responseObject[index];
                          return InkWell(
                            onTap: () {
                              context.goNamed(AppRoute.petDetails.name,
                                  extra: pet,
                                  pathParameters: {'id': pet.id.toString()});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: ShapeDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: Theme.of(context).cardTheme.shape!,
                              ),
                              child: Dismissible(
                                  key: ValueKey('pet-dissmisible-${pet.id}'),
                                  confirmDismiss: (direction) async {
                                    return await showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                context.l10n
                                                    .addPetScreenConfirmDelete,
                                                style:
                                                    AppTextStyle().dialogTitle,
                                              ),
                                              actionsAlignment:
                                                  MainAxisAlignment.center,
                                              content: Row(
                                                children: [
                                                  GenericButton(
                                                      onPressed: () {
                                                        return context
                                                            .pop(true);
                                                      },
                                                      widget: Text(
                                                          context.l10n.accept)),
                                                  const SizedBox.square(
                                                    dimension: 20,
                                                  ),
                                                  GenericButton(
                                                    onPressed: () {
                                                      return context.pop(false);
                                                    },
                                                    widget: Text(
                                                      context.l10n.cancel,
                                                      style: AppTextStyle()
                                                          .body
                                                          .copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ));
                                  },
                                  onDismissed: (direction) {
                                    ref
                                        .read(petControllerProvider.notifier)
                                        .deletePet(pet.id);
                                  },
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
                            ),
                          );
                        },
                      ),
                    ),
            );
          },
        ),
        Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {
                showAddPetBottomSheet(context);
              },
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}

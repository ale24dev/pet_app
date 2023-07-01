import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pet_app/src/core/widgets/empty_results_filed.dart';
import 'package:pet_app/src/feature/pets/controllers/add_pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';

class PetTypeField extends ConsumerStatefulWidget {
  const PetTypeField({super.key, this.onSuggestionSelected});

    final ValueChanged<PetType>? onSuggestionSelected;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PetTypeFieldState();
}

class _PetTypeFieldState extends ConsumerState<PetTypeField> {
  final petTypeController = TextEditingController();

  @override
  void dispose() {
    petTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final petTypeProviderValue = ref.watch(petTypeProvider.future);
    return TypeAheadFormField<PetType>(
      direction: AxisDirection.up,
      noItemsFoundBuilder: (_) => const EmptyResultField(),
      // validator: LocationValidator.province(context),
      textFieldConfiguration: TextFieldConfiguration(
        // textInputAction: textInputAction,
        decoration: const InputDecoration(labelText: 'Tipo de mascota'),
        controller: petTypeController,
      ),
      suggestionsCallback: (pattern) async {
        final petsType= await petTypeProviderValue;

        return petsType.where((type) {
          return type.name.toLowerCase().contains(pattern.toLowerCase());
        });
      },
      itemBuilder: (_, PetType petType) {
        return Padding(
            padding: const EdgeInsets.all(17), child: Text(petType.name));
      },
      onSuggestionSelected: (petType) {
        petTypeController.text = petType.name.capitalize;
        widget.onSuggestionSelected?.call(petType);
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10), elevation: 8),
    );
  }
}



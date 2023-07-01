import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_app/src/core/widgets/empty_results_filed.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/feature/pets/controllers/add_pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/breed_model.dart';

class BreedField extends ConsumerStatefulWidget {
  const BreedField({super.key, this.onSuggestionSelected});

    final ValueChanged<BreedModel>? onSuggestionSelected;


  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BreedFieldState();
}

class _BreedFieldState extends ConsumerState<BreedField> {
  final breedController = TextEditingController();

  @override
  void dispose() {
    breedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final breedProviderValue = ref.watch(breedProvider.future);
    return TypeAheadFormField<BreedModel>(
      direction: AxisDirection.up,
      noItemsFoundBuilder: (_) => const EmptyResultField(),
      validator: FormBuilderValidators.required(),
      textFieldConfiguration: TextFieldConfiguration(
        // textInputAction: textInputAction,
        decoration: const InputDecoration(labelText: 'Raza'),
        controller: breedController,
      ),
      suggestionsCallback: (pattern) async {
        final breeds = await breedProviderValue;

        return breeds.where((breed) {
          return breed.name.toLowerCase().contains(pattern.toLowerCase());
        });
      },
      itemBuilder: (_, BreedModel breed) {
        return Padding(
            padding: const EdgeInsets.all(17), child: Text(breed.name));
      },
      onSuggestionSelected: (breed) {
        breedController.text = breed.name.capitalize;
        widget.onSuggestionSelected?.call(breed);
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10), elevation: 8),
    ).requiredField();
  }
}

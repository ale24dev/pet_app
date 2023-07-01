import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pet_app/src/core/widgets/empty_results_filed.dart';
import 'package:pet_app/src/feature/pets/controllers/add_pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';

class PetStatusField extends ConsumerStatefulWidget {
  const PetStatusField({super.key, this.onSuggestionSelected});

  final ValueChanged<PetStatusModel>? onSuggestionSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetStatusFieldState();
}

class _PetStatusFieldState extends ConsumerState<PetStatusField> {
  final statusController = TextEditingController();

  @override
  void dispose() {
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final petStatusProviderValue = ref.watch(petStatusProvider.future);
    return TypeAheadFormField<PetStatusModel>(
      direction: AxisDirection.up,
      noItemsFoundBuilder: (_) => const EmptyResultField(),
      // validator: LocationValidator.province(context),
      textFieldConfiguration: TextFieldConfiguration(
        // textInputAction: textInputAction,
        decoration: const InputDecoration(labelText: 'Estado'),
        controller: statusController,
      ),
      suggestionsCallback: (pattern) async {
        final petsStatus = await petStatusProviderValue;

        return petsStatus.where((status) {
          return status.status.toLowerCase().contains(pattern.toLowerCase());
        });
      },
      itemBuilder: (_, PetStatusModel petsStatus) {
        return Padding(
            padding: const EdgeInsets.all(17), child: Text(petsStatus.status));
      },
      onSuggestionSelected: (petStatus) {
        statusController.text = petStatus.status.capitalize;
        widget.onSuggestionSelected?.call(petStatus);
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10), elevation: 8),
    );
  }
}

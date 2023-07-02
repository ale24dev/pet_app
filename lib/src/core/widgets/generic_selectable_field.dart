import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pet_app/src/core/widgets/empty_results_filed.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';

///This class show a [GenericSelectableField] and [T] determines the value to manage
///in this widget
class GenericSelectableField<T> extends StatelessWidget {
  const GenericSelectableField(
      {super.key,
      this.validator,
      this.controller,
      required this.value,
      required this.labelText,
      this.onSuggestionSelected});

  ///Validators of the field
  final FormFieldValidator<String>? validator;

  final TextEditingController? controller;

  ///This [value] contains the list of elements to show in the field
  final Future<List<T>> value;

  ///Callback to return a [T] value selected
  final ValueChanged<T>? onSuggestionSelected;

  ///Label text of field
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<T>(
      direction: AxisDirection.up,
      noItemsFoundBuilder: (_) => const EmptyResultField(),
      validator: validator,
      textFieldConfiguration: TextFieldConfiguration(
        // textInputAction: textInputAction,
        decoration: InputDecoration(labelText: labelText),
        controller: controller,
      ),
      suggestionsCallback: (pattern) async {
        final listValue = await value;

        return listValue.where((item) {
          return (T == PetStatusModel)
              ? (item as dynamic)
                  .status
                  .toLowerCase()
                  .contains(pattern.toLowerCase())
              : (item as dynamic)
                  .name
                  .toLowerCase()
                  .contains(pattern.toLowerCase());
        });
      },
      itemBuilder: (_, T model) {
        return Padding(
            padding: const EdgeInsets.all(17),
            child: Text((T == PetStatusModel)
                ? (model as dynamic).status
                : (model as dynamic).name));
      },
      onSuggestionSelected: (model) {
        controller!.text = (T == PetStatusModel)
            ? (model as dynamic).status
            : (model as dynamic).name;

        onSuggestionSelected?.call(model);
      },
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
          borderRadius: BorderRadius.circular(10), elevation: 8),
    ).requiredField();
  }
}

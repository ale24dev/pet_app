import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

///  Intended to used as validators in forms.
/// They describe the business rules associated with attributes of different data.
class PetValidator {
  final BuildContext context;
  PetValidator(this.context);

  FormFieldValidator<String>? firstName() => FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: context.l10n.requiredField),
        FormBuilderValidators.minLength(2,
            errorText: context.l10n.minLength(2)),
      ]);
  FormFieldValidator<String>? lastName() => FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: context.l10n.requiredField),
        FormBuilderValidators.minLength(2,
            errorText: context.l10n.minLength(2)),
      ]);

  FormFieldValidator<String>? password() => FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: context.l10n.requiredField),
        FormBuilderValidators.minLength(6,
            errorText: context.l10n.minLength(6)),
      ]);

  FormFieldValidator<String>? email() => FormBuilderValidators.compose([
        FormBuilderValidators.email(errorText: context.l10n.invalidEmail),
        FormBuilderValidators.required(errorText: context.l10n.requiredField),
      ]);

  static FormFieldValidator<String>? id = (s) {
    if (s == null || s.isEmpty) return null;

    return FormBuilderValidators.compose([
      FormBuilderValidators.minLength<String>(11),
      FormBuilderValidators.numeric(),
    ])(s);
  };
}

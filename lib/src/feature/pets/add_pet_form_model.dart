import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/core/widgets/pet_async_generic_button.dart';
import 'package:pet_app/src/core/widgets/text_field_birthday.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/breed_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';
import 'package:pet_app/src/feature/pets/widgets/breed_field.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_status_field.dart';
import 'package:pet_app/src/feature/pets/widgets/pet_type_field.dart';

class AddPetFormModel extends ConsumerStatefulWidget {
  const AddPetFormModel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPetFormModelState();
}

class _AddPetFormModelState extends ConsumerState<AddPetFormModel> {
  late final nameController = TextEditingController();
  late final heightController = TextEditingController();
  late final weightController = TextEditingController();
  late final ageController = TextEditingController();
  late final birthdayController = TextEditingController();
  late final descriptionController = TextEditingController();
  late final colorController = TextEditingController();
  late final genderController = TextEditingController();

  DateTime? birthdaySelected;
  BreedModel? breedModelSelected;
  PetType? petTypeSelected;
  PetStatusModel? petStatusSelected;

  late final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    for (final controller in [
      nameController,
      heightController,
      weightController,
      ageController,
      birthdayController,
      descriptionController,
      colorController,
      genderController,
    ]) {
      controller.dispose();
    }
  }

  void callbackSetBirthday(
      {required String newDate, required DateTime birthdaySelected}) {
    setState(() {
      birthdayController.text = newDate;
      this.birthdaySelected = birthdaySelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final petController = ref.watch(petControllerProvider);

    final currentUser = ref.watch(authControllerProvider).value;

    return Padding(
      padding: context.responsiveContentPadding,
      child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox.square(
                dimension: 10,
              ),
              GenericTextField(
                labelText: 'Nombre',
                textInputAction: TextInputAction.next,
                textEditingController: nameController,
                validator: FormBuilderValidators.required(
                    errorText: 'Este campo es requerido'),
                autofocus: true,
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                  labelText: 'Edad',
                  textInputAction: TextInputAction.next,
                  textEditingController: ageController),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: 'Color',
                textInputAction: TextInputAction.next,
                textEditingController: colorController,
                validator: FormBuilderValidators.required(
                    errorText: 'Este campo es requerido'),
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: 'Sexo',
                textInputAction: TextInputAction.next,
                textEditingController: genderController,
                validator: FormBuilderValidators.required(
                    errorText: 'Este campo es requerido'),
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: 'Altura',
                textInputAction: TextInputAction.next,
                textEditingController: heightController,
                prefixIcon: SizedBox(
                    width: 10,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'cm',
                          style: AppTextStyle()
                              .body
                              .copyWith(color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ))),
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: 'Peso',
                textInputAction: TextInputAction.next,
                textEditingController: weightController,
                prefixIcon: SizedBox(
                    width: 10,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'kg',
                          style: AppTextStyle()
                              .body
                              .copyWith(color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ))),
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              BreedField(onSuggestionSelected: (breedSelected) {
                setState(() {
                  breedModelSelected = breedSelected;
                });
              }),
              const SizedBox.square(
                dimension: 20,
              ),
              PetStatusField(
                onSuggestionSelected: (petStatusSelected) {
                  this.petStatusSelected = petStatusSelected;
                },
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              PetTypeField(onSuggestionSelected: (petTypeSelected) {
                this.petTypeSelected = petTypeSelected;
              }),
              const SizedBox.square(
                dimension: 20,
              ),
              TextFieldBirthday(
                  birthdayController: birthdayController,
                  callback: callbackSetBirthday),
              const SizedBox.square(
                dimension: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Descripción', alignLabelWithHint: true),
                minLines: 5,
                maxLines: 10,
                controller: descriptionController,
                textInputAction: TextInputAction.done,
                validator: 
                  FormBuilderValidators.required(
                      errorText: 'Este campo es requerido'),
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: AsyncGenericButton(
                    onTap: () async {
                      if (formKey.currentState?.validate() ?? false) {
                        formKey.currentState?.save();
                        final success = await ref
                            .read(petControllerProvider.notifier)
                            .addPet(PetModel(
                                id: null,
                                name: nameController.text,
                                description: descriptionController.text,
                                color: colorController.text,
                                gender: genderController.text,
                                age: ageController.text.isNotEmpty
                                    ? int.parse(ageController.text)
                                    : null,
                                birthday: birthdaySelected,
                                height: heightController.text.isNotEmpty
                                    ? double.parse(heightController.text)
                                    : null,
                                weight: weightController.text.isNotEmpty
                                    ? double.parse(weightController.text)
                                    : null,
                                user: currentUser!.user!.parseToModel(),
                                petType: petTypeSelected!,
                                petStatusModel: petStatusSelected!,
                                breedModel: breedModelSelected!));

                        if (context.mounted && success) {
                          context.pop();
                        }
                      }
                    },
                    asyncValue: petController,
                    child: const Text('Guardar')),
              ),
              const SizedBox.square(
                dimension: 50,
              ),
            ],
          )),
    );
  }
}
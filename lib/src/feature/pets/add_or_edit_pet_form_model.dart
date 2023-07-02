import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/utils/datetimes.dart';
import 'package:pet_app/src/core/widgets/generic_selectable_field.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/core/widgets/pet_async_generic_button.dart';
import 'package:pet_app/src/core/widgets/text_field_birthday.dart';
import 'package:pet_app/src/core/widgets/widget_extensions.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:pet_app/src/feature/pets/controllers/add_pet_controller.dart';
import 'package:pet_app/src/feature/pets/controllers/pet_controller.dart';
import 'package:pet_app/src/feature/pets/controllers/profile_pet_controller.dart';
import 'package:pet_app/src/feature/pets/data/model/breed_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';

class AddOrEditPetFormModel extends ConsumerStatefulWidget {
  const AddOrEditPetFormModel({super.key, this.edit = false, this.pet});

  ///This flag indicate if a modal is for edit pet
  final bool edit;

  ///Pet to edit
  final Pet? pet;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddOrEditPetFormModelState();
}

class _AddOrEditPetFormModelState extends ConsumerState<AddOrEditPetFormModel> {
  late final nameController = TextEditingController();
  late final heightController = TextEditingController();
  late final weightController = TextEditingController();
  late final ageController = TextEditingController();
  late final birthdayController = TextEditingController();
  late final descriptionController = TextEditingController();
  late final colorController = TextEditingController();
  late final genderController = TextEditingController();
  late final breedController = TextEditingController();
  late final statusController = TextEditingController();
  late final typeController = TextEditingController();

  DateTime? birthdaySelected;
  BreedModel? breedModelSelected;
  PetType? petTypeSelected;
  PetStatusModel? petStatusSelected;

  late final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.edit) {
      nameController.text = widget.pet!.name;
      heightController.text = widget.pet!.height?.toString() ?? '';
      weightController.text = widget.pet!.weight?.toString() ?? '';
      ageController.text = widget.pet!.age?.toString() ?? '';
      birthdayController.text = widget.pet!.birthday != null
          ? AppDateFormats.formatDMY(widget.pet!.birthday!)
          : '';
      descriptionController.text = widget.pet!.description;
      colorController.text = widget.pet!.color;
      genderController.text = widget.pet!.gender;
      breedController.text = widget.pet!.breedModel.name;
      statusController.text = widget.pet!.petStatusModel.status;
      typeController.text = widget.pet!.petType.name;

      petTypeSelected = widget.pet!.petType;
      breedModelSelected = widget.pet!.breedModel;
      petStatusSelected = widget.pet!.petStatusModel;
      // final user = ref.watch(authControllerProvider).value;
    }
    super.initState();
  }

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
      breedController,
      statusController,
      typeController,
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
                labelText: context.l10n.addPetScreenName,
                textInputAction: TextInputAction.next,
                textEditingController: nameController,
                validator: FormBuilderValidators.required(
                    errorText: context.l10n.requiredField),
                autofocus: true,
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                  labelText: context.l10n.addPetScreenAge,
                  textInputAction: TextInputAction.next,
                  textEditingController: ageController),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: context.l10n.addPetScreenColor,
                textInputAction: TextInputAction.next,
                textEditingController: colorController,
                validator: FormBuilderValidators.required(
                    errorText: context.l10n.requiredField),
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: context.l10n.addPetScreenGender,
                textInputAction: TextInputAction.next,
                textEditingController: genderController,
                validator: FormBuilderValidators.required(
                    errorText: context.l10n.requiredField),
              ).requiredField(),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericTextField(
                labelText: context.l10n.addPetScreenHeight,
                textInputAction: TextInputAction.next,
                textEditingController: heightController,
                prefixIcon: SizedBox(
                    width: 10,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          context.l10n.cm,
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
                labelText: context.l10n.addPetScreenWeight,
                textInputAction: TextInputAction.next,
                textEditingController: weightController,
                prefixIcon: SizedBox(
                    width: 10,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          context.l10n.kg,
                          style: AppTextStyle()
                              .body
                              .copyWith(color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ))),
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              TextFieldBirthday(
                  birthdayController: birthdayController,
                  callback: callbackSetBirthday),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericSelectableField<BreedModel>(
                  controller: breedController,
                  labelText: context.l10n.addPetScreenBreed,
                  value: ref.watch(breedProvider.future),
                  validator: FormBuilderValidators.required(
                      errorText: context.l10n.requiredField),
                  onSuggestionSelected: (breedSelected) {
                    setState(() {
                      breedModelSelected = breedSelected;
                    });
                  }),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericSelectableField<PetType>(
                  controller: typeController,
                  labelText: context.l10n.addPetScreenPetType,
                  value: ref.watch(petTypeProvider.future),
                  validator: FormBuilderValidators.required(
                      errorText: context.l10n.requiredField),
                  onSuggestionSelected: (petTypeSelected) {
                    setState(() {
                      this.petTypeSelected = petTypeSelected;
                    });
                  }),
              const SizedBox.square(
                dimension: 20,
              ),
              GenericSelectableField<PetStatusModel>(
                  controller: statusController,
                  labelText: context.l10n.addPetScreenPetStatus,
                  value: ref.watch(petStatusProvider.future),
                  validator: FormBuilderValidators.required(
                      errorText: context.l10n.requiredField),
                  onSuggestionSelected: (petStatusSelected) {
                    setState(() {
                      this.petStatusSelected = petStatusSelected;
                    });
                  }),
              const SizedBox.square(
                dimension: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: context.l10n.addPetScreenDescription,
                    alignLabelWithHint: true),
                minLines: 5,
                maxLines: 10,
                controller: descriptionController,
                textInputAction: TextInputAction.done,
                validator: FormBuilderValidators.required(
                    errorText: context.l10n.requiredField),
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

                        var success = false;
                        if (widget.edit) {
                          success = await ref
                              .read(
                                  profilePetControllerProvider(widget.pet!.id!)
                                      .notifier)
                              .updatePet(PetModel(
                                  id: widget.pet!.id,
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
                        } else {
                          success = await ref
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
                        }

                        if (context.mounted && success) {
                          context.pop();
                          context.showSuccessSnackBar(
                              text: context.l10n.profileUpdatedSuccess);
                        }
                      }
                    },
                    asyncValue: petController,
                    child: Text(context.l10n.save)),
              ),
              const SizedBox.square(
                dimension: 50,
              ),
            ],
          )),
    );
  }
}

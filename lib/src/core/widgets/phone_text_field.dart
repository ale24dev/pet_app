import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

class PhoneTextField extends StatelessWidget {
  final String initialCountryCode;
  final TextEditingController? controller;

  const PhoneTextField({
    super.key,
    this.initialCountryCode = 'CU',
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: IntlPhoneField(
        flagsButtonPadding: const EdgeInsets.only(bottom: 2),
        controller: controller,
        pickerDialogStyle: PickerDialogStyle(
            countryNameStyle: AppTextStyle().body,
            countryCodeStyle: AppTextStyle().body,
            notFound: Text(
              context.l10n.noResults,
              style: AppTextStyle().body,
            ),),
        style: AppTextStyle().body.copyWith(),
        invalidNumberMessage: context.l10n.signupScreenInvalidNumber,
        searchText: context.l10n.signupScreenSearchCountry,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          labelText: context.l10n.signupScreenPhone,
        ),
        initialCountryCode: initialCountryCode,
        onChanged: (phone) {
          //print(phone.completeNumber);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_app/src/core/utils/datetimes.dart';

class TextFieldBirthday extends StatefulWidget {
  const TextFieldBirthday({
    super.key,
    required this.birthdayController,
    required this.callback,
  });

  final TextEditingController birthdayController;

  final Function callback;

  @override
  State<TextFieldBirthday> createState() => _TextFieldBirthdayState();
}

class _TextFieldBirthdayState extends State<TextFieldBirthday> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(
          labelText: 'Cumpleaños',
        ),
        controller: widget.birthdayController,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2015),
              lastDate: DateTime.now());

          if (pickedDate != null) {
            widget.callback(newDate: AppDateFormats.formatDMY(pickedDate), birthdaySelected: pickedDate);
          }
        });
  }
}



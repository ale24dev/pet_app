import 'package:flutter/material.dart';

import 'package:pet_app/resources/pet_icon.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    super.key,
    required this.labelText,
    required this.textInputType,
    required this.textInputAction,
    this.obscureText,
    required this.textEditingController,
    this.errorText,
  });

  final String labelText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final String? errorText;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  // * Flag to know if password is visible or not
  late bool showPassword;

  @override
  void initState() {
    showPassword = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double sizeWidget = 60;

    return SizedBox(
      height: sizeWidget,
      child: TextFormField(
        keyboardType: widget.textInputType,
        textInputAction: widget.textInputAction,
        obscureText: showPassword,
        controller: widget.textEditingController,
        decoration: InputDecoration(
            labelText: widget.labelText,
            suffixIcon: widget.obscureText == null
                ? null
                : IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? const Icon(PetIcon.eye)
                        : const Icon(PetIcon.eye_closed)),
            errorText: widget.errorText),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:pet_app/resources/pet_icon.dart';

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    super.key,
    required this.labelText,
    this.textInputType,
    required this.textInputAction,
    this.obscureText,
    required this.textEditingController,
    this.errorText,
    this.maxLines,
    this.autofocus = false,
  });

  final String labelText;
  final TextInputType? textInputType;
  final TextInputAction textInputAction;
  final bool? obscureText;
  final TextEditingController textEditingController;
  final String? errorText;
  final int? maxLines;
  final bool autofocus;

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
      child: TextField(
        keyboardType: widget.textInputType ?? TextInputType.text,
        textInputAction: widget.textInputAction,
        obscureText: showPassword,
        controller: widget.textEditingController,
        maxLines: widget.maxLines,
        autofocus: widget.autofocus,
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

extension GenericTextFieldX on GenericTextField {
  Widget requiredField() {
    return Stack(
      children: [
        this,
        const Positioned(
            top: 5,
            right: 5,
            child: Text(
              '*',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ))
      ],
    );
  }
}

extension TextFieldX on TextField {
  Widget requiredField() {
    return Stack(
      
      children: [
        this,
        const Positioned(
            top: 5,
            right: 5,
            child: Text(
              '*',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ))
      ],
    );
  }
}

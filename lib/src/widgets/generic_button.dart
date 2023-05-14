import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  const GenericButton({
    super.key,
    required this.text,
    required this.function,
  });

  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            onPressed: () {
              function();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            )));
  }
}

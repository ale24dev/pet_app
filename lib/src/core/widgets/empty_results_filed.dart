import 'package:flutter/material.dart';

class EmptyResultField extends StatelessWidget {
  const EmptyResultField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Empty results'),
    );
  }
}

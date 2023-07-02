import 'package:flutter/material.dart';
import 'package:pet_app/resources/l10n/l10n.dart';

class EmptyResultField extends StatelessWidget {
  const EmptyResultField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(context.l10n.emptyResults),
    );
  }
}

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class PetDetailBox extends StatelessWidget {
  const PetDetailBox(
      {super.key, required this.title, required this.description});

  ///Show the title of the box
  final String title;

  ///Show the description of the box
  final String description;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: const Color(0xFFf6f6f6),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Text(
            title,
            style: AppTextStyle()
                .body
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox.square(
            dimension: 5,
          ),
          Text(description),
        ]),
      ),
    );
  }
}

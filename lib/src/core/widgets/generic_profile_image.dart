import 'package:flutter/material.dart';

class GenericProfileImage extends StatelessWidget {
  const GenericProfileImage({
    super.key,
    required this.image, required this.imageRadius,
  });
  final double imageRadius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: imageRadius * 2,
        width: imageRadius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.network(image),
        ),
      ),
    );
  }
}
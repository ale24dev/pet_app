import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
    required this.image,
    this.height = 300,
  });

  final String image;

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: height,
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          Text(
            'No hay favoritos',
            style: AppTextStyle().emptyData,
          ),
        ],
      ),
    );
  }
}

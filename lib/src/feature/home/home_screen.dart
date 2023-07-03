import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/feature/home/controller/publication_controller.dart';
import 'package:pet_app/src/feature/home/data/publication.dart';
import 'package:pet_app/src/feature/home/widgets/publication_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen(
      {super.key,
      required this.xOffset,
      required this.yOffset,
      required this.isDrawerOpen});

  ///Control of position when the drawer is open
  final double xOffset;
  final double yOffset;
  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicationController = ref.watch(publicationControllerProvider);
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.80 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: 200.ms,
      decoration: BoxDecoration(
          color: AppColor.scaffold,
          borderRadius: isDrawerOpen ? BorderRadius.circular(12) : null),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AsyncValueWidget(
            value: publicationController,
            data: (value) {
              List<Publication> listPublications = value.responseObject;
              return ListView.builder(
                  itemCount: listPublications.length,
                  itemBuilder: (context, index) {
                    return PublicationCard(
                        publication: listPublications[index]);
                  });
            },
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/async_value.dart';
import 'package:pet_app/src/feature/home/controller/publication_controller.dart';
import 'package:pet_app/src/feature/home/data/publication.dart';
import 'package:pet_app/src/feature/home/widgets/publication_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

//18294
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publicationController = ref.watch(publicationControllerProvider);
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: AsyncValueWidget(
          value: publicationController,
          data: (value) {
              List<Publication> listPublications = value.responseObject;
            return ListView.builder(
              itemCount: listPublications.length,
              itemBuilder: (context, index){
              return PublicationCard(publication: listPublications[index]);
            });
          },
        ));
  }
}

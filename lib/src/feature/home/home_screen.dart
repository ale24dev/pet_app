import 'package:flutter/material.dart';
import 'package:pet_app/src/feature/home/data/publication.dart';
import 'package:pet_app/src/feature/home/widgets/publication_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: listPublicationMock.length,
        itemBuilder: (context, index) {
          final publication = listPublicationMock[index];
          return PublicationCard(
            publication: publication,
          );
        },
      ),
    );
  }
}

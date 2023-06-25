import 'package:flutter/material.dart';
import 'package:pet_app/src/core/services/supabase_service.dart';
import 'package:pet_app/src/feature/home/data/publication_repository.dart';
import 'package:pet_app/src/feature/home/widgets/publication_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final publicationRepository =
        PublicationRepository(supabaseClient: SupabaseService.supabaseClient);
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: publicationRepository.getById(1),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              final data = snapshot.data;
              return ListView.builder(
                itemCount: data!.responseObject.length,
                itemBuilder: (context, index) {
                  final publication =
                      data.responseObject[index];
                  return PublicationCard(
                    publication: publication,
                  );
                },
              );
            }
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pet_app/src/feature/pets/domain/pet.dart';

class PetDetails extends StatelessWidget {
  const PetDetails({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}

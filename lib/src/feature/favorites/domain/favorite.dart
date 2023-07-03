import 'package:pet_app/src/feature/auth/data/model/user_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_model.dart';

class Favorite {
  final int? id;
  final UserModel user;
  final PetModel pet;

  const Favorite(
      {this.id, required this.pet, required this.user});
}

import 'package:pet_app/src/feature/auth/data/model/user_model.dart';
import 'package:pet_app/src/feature/auth/domain/user.dart';
import 'package:pet_app/src/feature/pets/data/model/breed_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_status_model.dart';
import 'package:pet_app/src/feature/pets/data/model/pet_type.dart';

class Pet {
  final int? id;
  final int? age;
  final String name;
  final double? weight;
  final double? height;
  final DateTime? birthday;
  final String description;
  final String color;
  final String gender;
  final String? image;
  final BreedModel breedModel;
  final PetType petType;
  final PetStatusModel petStatusModel;
  final User user;
  // final String status;

  const Pet({
    this.id,
    required this.name,
    required this.color,
    this.age,
    this.birthday,
    required this.description,
    required this.gender,
    this.height,
    this.weight,
    this.image,
    required this.breedModel,
    required this.user,
    required this.petType,
    required this.petStatusModel,
    // required this.status,
  });
}

final listPetsMock = List.generate(
    4,
    (index) => Pet(
        id: index,
        color: 'Red',
        description: 'Animal de casa',
        gender: 'Masculino',
        image: 'Image',
        name: 'Harley',
        user: UserModel(
            id: index.toString(),
            updatedAt: DateTime.now(),
            username: 'ale24',
            avatarUrl: 'asasasas',
            fullname: 'Ale Diaz'),
        petStatusModel: PetStatusModel(id: index, status: 'perdido'),
        petType: PetType(id: index, name: 'Perro'),
        breedModel: BreedModel(id: index, name: 'Pastor')
        // status: 'Adpoción',
        ));

extension PetX on Pet {
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'name': name,
      'weight': weight,
      'height': height,
      'birthday': birthday?.toIso8601String(),
      'description': description,
      'color': color,
      'gender': gender,
      'image': image,
      'breed': breedModel.id,
      'pet_type': petType.id,
      'pet_status': petStatusModel.id,
      'user': user.id,
    };
  }
}

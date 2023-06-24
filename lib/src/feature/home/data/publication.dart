import 'package:pet_app/resources/assets.dart';
import 'package:pet_app/src/feature/auth/data/user.dart';

class Publication {
  final String id;
  final String image;
  final User user;
  final DateTime createdAt;

  const Publication(
      {required this.id,
      required this.image,
      required this.user,
      required this.createdAt});
}

final listPublicationMock = List.generate(
    5,
    (index) => Publication(
        id: index.toString(),
        image: AppAsset.onboardingScreen3,
        user: userMock,
        createdAt: DateTime.now()));

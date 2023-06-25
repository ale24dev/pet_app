import 'package:pet_app/src/feature/auth/data/model/user_model.dart';

class Publication {
  final int id;
  final List<String>? images;
  final String text;
  final UserModel user;
  final DateTime createdAt;

  const Publication(
      {required this.id,
      this.images,
      required this.user,
      required this.text,
      required this.createdAt});
}

extension PublicationX on Publication {
  bool hasImage() {
    return images != null;
  }
}

// final listPublicationMock = List.generate(
//     5,
//     (index) => Publication(
//         id: index.toString(),
//         image: AppAsset.onboardingScreen3,
//         user: userMock,
//         createdAt: DateTime.now()));

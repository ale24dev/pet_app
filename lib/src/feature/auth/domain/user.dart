import 'package:pet_app/src/feature/auth/data/model/user_model.dart';

class User {
  final String id;
  final String username;
  final DateTime updatedAt;
  final String? fullname;
  final String avatarUrl;

  const User(
      {required this.id,
      required this.username,
      this.fullname,
      required this.updatedAt,
      required this.avatarUrl});
}

final userMock = UserModel(
    id: '0504e9e8-07a8-4688-a1f9-392eb565d613',
    updatedAt: DateTime.now(),
    username: 'username',
    avatarUrl: 'avatarUrl');
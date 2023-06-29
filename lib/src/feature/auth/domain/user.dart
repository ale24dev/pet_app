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

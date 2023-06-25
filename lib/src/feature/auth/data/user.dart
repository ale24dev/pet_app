class User {
  final String id;
  final String name;
  final String lastName;

  const User({required this.id, required this.name, required this.lastName});
}

const userMock = User(id: "1", name: "Selena", lastName: 'Caramony');

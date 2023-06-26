class Pet {
  final int id;
  final int? age;
  final String name;
  final double? weight;
  final double? height;
  final DateTime? birthday;
  final String description;
  final String color;
  final String gender;
  final String image;
  final String status;

  const Pet({
    required this.id,
    required this.color,
    this.age,
    this.birthday,
    required this.description,
    required this.gender,
    this.height,
    this.weight,
    required this.image,
    required this.name,
    required this.status,
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
          status: 'Adpoción',
        ));

class Character {
  late final String name;
  late final String house;
  late final bool isStudent;
  late final String actor;
  late final String image;
  Character({
    required this.name,
    required this.actor,
    required this.house,
    required this.image,
    required this.isStudent,
  });

  factory Character.fromjson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      actor: json['actor'],
      house: json['house'],
      image: json['image'],
      isStudent: json['hogwartsStudent'],
    );
  }
}

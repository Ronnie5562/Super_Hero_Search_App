class HeroListModel {
  final String name;
  final String imageUrl;
  final String realName;
  final String publisher;

  HeroListModel({
    required this.name,
    required this.imageUrl,
    required this.realName,
    required this.publisher,
  });

  factory HeroListModel.fromMap(Map<String, dynamic> map) {
    return HeroListModel(
      name: map['name'],
      imageUrl: map['image']['url'],
      realName: map['biography']['full-name'],
      publisher: map['biography']['publisher'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'fullName': realName,
      'publisher': publisher,
    };
  }
}

class HeroDetailModel {
  final String name;
  final String imageUrl;

  // Biography
  final String realName;
  final String publisher;
  final String firstAppearance;
  final String placeOfBirth;

  // Powerstats
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String combat;

  // Appearance
  final String race;
  final String gender;
  final String eyeColor;
  final String hairColor;

  HeroDetailModel({
    required this.name,
    required this.imageUrl,
    required this.realName,
    required this.publisher,
    required this.firstAppearance,
    required this.placeOfBirth,
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.combat,
    required this.race,
    required this.gender,
    required this.eyeColor,
    required this.hairColor,
  });

  factory HeroDetailModel.fromMap(Map<String, dynamic> map) {
    return HeroDetailModel(
      name: map['name'],
      imageUrl: map['image']['url'],
      realName: map['biography']['full-name'],
      publisher: map['biography']['publisher'],
      firstAppearance: map['biography']['first-appearance'],
      placeOfBirth: map['biography']['place-of-birth'],
      intelligence: map['powerstats']['intelligence'],
      strength: map['powerstats']['strength'],
      speed: map['powerstats']['speed'],
      durability: map['powerstats']['durability'],
      combat: map['powerstats']['combat'],
      race: map['appearance']['race'],
      gender: map['appearance']['gender'],
      eyeColor: map['appearance']['eye-color'],
      hairColor: map['appearance']['hair-color'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'biography': {
        'fullName': realName,
        'publisher': publisher,
        'firstAppearance': firstAppearance,
        'placeOfBirth': placeOfBirth,
      },
      'powerstats': {
        'intelligence': intelligence,
        'strength': strength,
        'speed': speed,
        'durability': durability,
        'combat': combat,
      },
      'appearance': {
        'race': race,
        'gender': gender,
        'eyeColor': eyeColor,
        'hairColor': hairColor,
      },
    };
  }
}

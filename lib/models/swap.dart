class Swap {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;

  Swap({this.name, this.height, this.mass, this.hairColor, this.skinColor});

  factory Swap.fromJson(Map json) {
    return Swap(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hairColor,
      'skin_color': skinColor,
    };
  }
}
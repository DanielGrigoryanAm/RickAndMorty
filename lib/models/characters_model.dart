class CharactersModel {
  final int id;
  final String name;
  final String status;
  final String image;
  final String species;
  final String location;
  final String gender;
  final String origin;

  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.species,
    required this.location,
    required this.gender,
    required this.origin,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      image: json['image'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin']['name'],
      location: json['location']['name'],
    );
  }

  static List<CharactersModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CharactersModel.fromJson(json)).toList();
  }
}

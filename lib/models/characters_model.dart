class CharactersModel {
  final int id;
  final String name;
  final String status;
  final String image;

  CharactersModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    return CharactersModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      image: json['image'],
    );
  }

  static List<CharactersModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CharactersModel.fromJson(json)).toList();
  }
}

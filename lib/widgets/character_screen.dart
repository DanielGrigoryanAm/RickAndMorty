import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/characters_model.dart';

class CharacterScreen extends StatelessWidget {
  final List<CharactersModel> characters;
  final int index;
  const CharacterScreen({
    super.key,
    required this.characters,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final character = characters[index];
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(character.image),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Location: ${character.location}'),
                  Text('Origin: ${character.origin}'),
                  Text('Species: ${character.species}'),
                  Text('Gender: ${character.gender}'),
                  Text('Status: ${character.status}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

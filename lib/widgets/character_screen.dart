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
        backgroundColor: const Color.fromARGB(255, 174, 247, 255),
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
                  _buildInfoRow('Location:', character.location),
                  _buildInfoRow('Origin:', character.origin),
                  _buildInfoRow('Species:', character.species),
                  _buildInfoRow('Gender:', character.gender),
                  _buildInfoRow('Status:', character.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Text.rich(
      TextSpan(
        text: '$label ',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
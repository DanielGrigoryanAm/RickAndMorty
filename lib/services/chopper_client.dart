import 'package:chopper/chopper.dart';
import 'rick_morty_api.dart';

final chopper = ChopperClient(
  baseUrl: Uri.parse('https://rickandmortyapi.com/api'),
  services: [
    RickMortyApiService.create(),
  ],
  converter: const JsonConverter(),
);

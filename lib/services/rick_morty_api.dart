import 'package:chopper/chopper.dart';

part 'rick_morty_api.chopper.dart';

@ChopperApi()
abstract class RickMortyApiService extends ChopperService {
  @Get(path: '/character')
  Future<Response> getCharacters();

  static RickMortyApiService create([ChopperClient? client]) => _$RickMortyApiService(client);
}

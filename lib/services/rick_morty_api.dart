import 'package:chopper/chopper.dart';

part 'rick_morty_api.chopper.dart';

@ChopperApi()
abstract class RickMortyApiService extends ChopperService {
  @Get(path: '/charecter')
  Future<Response> getCharecters();

  static RickMortyApiService create([ChopperClient? client]) => _$RickMortyApiService(client);
}

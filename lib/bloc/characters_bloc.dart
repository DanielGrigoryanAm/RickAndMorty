import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/services/chopper_client.dart';
import 'package:rick_and_morty/services/rick_morty_api.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<GetCharactersEvent>((event, emit) async {
      emit(LoadingCharactersState());

      try {
        final characters = await fetchCharacters();
        emit(LoadedCharactersState(characters: characters));
      } catch (e) {
        emit(ErrorCharactersState(message: e.toString()));
      }
    });
  }
}

Future<List<CharactersModel>> fetchCharacters() async {
  final service = chopper.getService<RickMortyApiService>();
  final response = await service.getCharacters();

  if (response.isSuccessful) {
    final results = response.body['results'] as List<dynamic>;
    return CharactersModel.fromJsonList(results);
  } else {
    throw Exception('error loading characters');
  }
}

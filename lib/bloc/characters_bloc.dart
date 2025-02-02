import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
        emit(LoadedCharactersState(
            characters: characters, filteredCharacters: characters));
      } catch (e) {
        emit(ErrorCharactersState(message: e.toString()));
      }
    });

    on<SearchCharactersEvent>((event, emit) {
      final currentState = state;
      if (currentState is LoadedCharactersState) {
        final filtered = currentState.characters
            .where((character) => character.name
                .toLowerCase()
                .startsWith(event.query.toLowerCase()))
            .toList();
        emit(currentState.copyWith(filteredCharacters: filtered));
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

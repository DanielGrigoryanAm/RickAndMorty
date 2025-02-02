part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {}

class LoadingCharactersState extends CharactersState {}

class LoadedCharactersState extends CharactersState {
  final List<CharactersModel> characters;
  final List<CharactersModel> filteredCharacters;

  LoadedCharactersState({
    required this.characters,
    required this.filteredCharacters,
  });

  LoadedCharactersState copyWith({
    List<CharactersModel>? filteredCharacters,
  }) {
    return LoadedCharactersState(
      characters: characters,
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
    );
  }
}

class ErrorCharactersState extends CharactersState {
  final String message;

  ErrorCharactersState({required this.message});
}

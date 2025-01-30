part of 'characters_bloc.dart';

@immutable
sealed class CharactersState {}

class CharactersInitial extends CharactersState {
}

class LoadingCharactersState extends CharactersState {}

class LoadedCharactersState extends CharactersState {
  final List<CharactersModel> characters;

  LoadedCharactersState({required this.characters});
}

class ErrorCharactersState extends CharactersState {
  final String message;

  ErrorCharactersState({required this.message});
}

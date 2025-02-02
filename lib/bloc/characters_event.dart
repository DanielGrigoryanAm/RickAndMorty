part of 'characters_bloc.dart';

@immutable
sealed class CharactersEvent {}

class GetCharactersEvent extends CharactersEvent {}

class SearchCharactersEvent extends CharactersEvent {
  final String query;

  SearchCharactersEvent({required this.query});
}

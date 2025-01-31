import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters_bloc.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/widgets/character_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharactersBloc()..add(GetCharactersEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Characters Rick and Morty")),
        body: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
            if (state is LoadingCharactersState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedCharactersState) {
              final List<CharactersModel> characters = state.characters;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterScreen(
                                    characters: characters,
                                    index: index,
                                  )),
                        );
                      },
                      child: Column(
                        children: [
                          Expanded(
                              child: Image.network(
                            character.image,
                            fit: BoxFit.cover,
                          )),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(character.name),
                                Text(character.species)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ErrorCharactersState) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return Center(child: Text("Loading..."));
          },
        ),
      ),
    );
  }
}

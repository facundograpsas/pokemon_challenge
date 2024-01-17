import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_challenge/features/home/bloc/home_bloc.dart';
import 'package:pokemon_challenge/features/home/bloc/home_events.dart';
import 'package:pokemon_challenge/features/home/bloc/home_state.dart';
import 'package:pokemon_challenge/features/home/widgets/pokemon_list_tile.dart';

class PokemonsList extends StatelessWidget {
  final HomePageLoaded state;

  const PokemonsList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var pokemon = state.pokemons[index];
        if (state.pokemonImages?[pokemon.name] == null) {
          context.read<HomePageBloc>().add(
                FetchPokemonImageEvent(pokemon.url!, index, pokemon.name!),
              );
        }
        var imageUrl = state.pokemonImages![pokemon.name];
        return PokemonListTile(
          key: ValueKey(pokemon.name),
          imageUrl: imageUrl,
          pokemonName: pokemon.name!,
          onTap: () {
            context
                .pushNamed('details', pathParameters: {'name': pokemon.name!});
          },
        );
      },
      itemCount: state.pokemons.length,
    );
  }
}

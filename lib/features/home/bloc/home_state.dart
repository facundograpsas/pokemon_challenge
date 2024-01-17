import 'package:pokemon_challenge/models/pokemon.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<Pokemon> pokemons;
  Map<String, String>? pokemonImages;
  HomePageLoaded({required this.pokemons, required this.pokemonImages});
}

class HomePageError extends HomePageState {
  final String message;

  HomePageError({this.message = ''});
}

class PokemonSearchLoaded extends HomePageState {
  final List<Pokemon> pokemons;

  PokemonSearchLoaded(this.pokemons);
}

class PokemonSearchError extends HomePageState {
  final String message;

  PokemonSearchError(this.message);
}

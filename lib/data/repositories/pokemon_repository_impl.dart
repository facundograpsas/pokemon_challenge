import 'package:pokemon_challenge/data/api/pokemon_api.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/models/pokemon.dart';
import 'package:pokemon_challenge/models/pokemon_details.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  late final PokemonApi pokemonApi;

  PokemonRepositoryImpl({required this.pokemonApi});

  @override
  Future<List<Pokemon>> getPokemons({int offset = 0, int limit = 20}) {
    return pokemonApi.getPokemons(offset: offset, limit: limit);
  }

  @override
  Future<PokemonDetails> getPokemon({required String name}) {
    return pokemonApi.getPokemon(name: name);
  }

  @override
  Future<String> getPokemonImageUrl(String detailUrl) {
    return pokemonApi.getPokemonImageUrl(detailUrl);
  }
}

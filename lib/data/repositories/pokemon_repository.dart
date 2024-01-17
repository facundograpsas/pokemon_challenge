import 'package:pokemon_challenge/models/pokemon.dart';
import 'package:pokemon_challenge/models/pokemon_details.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({int offset, int limit});
  Future<PokemonDetails> getPokemon({required String name});
  Future<String> getPokemonImageUrl(String detailUrl);
}

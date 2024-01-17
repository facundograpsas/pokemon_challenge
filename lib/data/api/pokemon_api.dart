import 'package:dio/dio.dart';
import 'package:pokemon_challenge/models/pokemon.dart';
import 'package:pokemon_challenge/models/pokemon_details.dart';

abstract class PokemonApi {
  PokemonApi(Dio dio, {required String baseUrl});

  Future<List<Pokemon>> getPokemons({int offset, int limit});

  Future<PokemonDetails> getPokemon({String name});

  Future<String> getPokemonImageUrl(String detailUrl);
}

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokemon_challenge/configs/app_config.dart';
import 'package:pokemon_challenge/data/api/pokemon_api.dart';
import 'package:pokemon_challenge/models/pokemon.dart';
import 'package:pokemon_challenge/models/pokemon_details.dart';
import 'package:pokemon_challenge/models/pokemons_response.dart';

class PokemonApiImpl implements PokemonApi {
  PokemonApiImpl(this._dio);

  final Dio _dio;
  final String _pokemonsUrl = AppConfig.pokemonsUrl;

  @override
  Future<List<Pokemon>> getPokemons({int offset = 0, int limit = 20}) async {
    try {
      var response = await _dio.get(
        _pokemonsUrl,
        queryParameters: {
          'offset': offset,
          'limit': limit,
        },
      );
      final responseJSON =
          jsonDecode(response.toString()) as Map<String, dynamic>;
      final list = PokemonResponse.fromJson(responseJSON);
      return list.results;
    } on DioException catch (e) {
      throw Exception('Failed to load pokemons: ${e.message}');
    }
  }

  @override
  Future<PokemonDetails> getPokemon({String? name}) async {
    try {
      final response = await _dio.get('$_pokemonsUrl$name');
      return PokemonDetails.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load pokemon: ${e.message}');
    }
  }

  @override
  Future<String> getPokemonImageUrl(String detailUrl) async {
    try {
      final response = await _dio.get(detailUrl);
      final data = response.data;
      return data['sprites']['front_default'];
    } on DioException catch (e) {
      throw Exception('Failed to load pokemon image: ${e.message}');
    }
  }
}

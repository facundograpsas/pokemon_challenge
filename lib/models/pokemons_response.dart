import 'package:pokemon_challenge/models/pokemon.dart';

class PokemonResponse {
  PokemonResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Pokemon> results;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: json['results'] == null
          ? []
          : List<Pokemon>.from(
              (json['results'] as List<dynamic>).map(
                (x) => Pokemon.fromJson(x as Map<String, dynamic>),
              ),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        'count': count,
        'next': next,
        'previous': previous,
        'results': results.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return '$count, $next, $previous, $results, ';
  }
}

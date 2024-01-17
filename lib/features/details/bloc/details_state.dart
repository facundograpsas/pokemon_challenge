import 'package:pokemon_challenge/models/pokemon_details.dart';

abstract class DetailsPageState {}

class DetailsPageLoading extends DetailsPageState {}

class DetailsPageLoaded extends DetailsPageState {
  final PokemonDetails pokemon;
  DetailsPageLoaded({required this.pokemon});
}

class DetailsPageError extends DetailsPageState {
  final String message;

  DetailsPageError({this.message = ''});
}

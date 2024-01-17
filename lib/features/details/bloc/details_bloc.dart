import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/features/details/bloc/details_event.dart';
import 'package:pokemon_challenge/features/details/bloc/details_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc({required this.pokemonRepository})
      : super(DetailsPageLoading()) {
    on<FetchPokemonDetailsEvent>(
      _onFetchPokemonDetails,
    );
  }
  final PokemonRepository pokemonRepository;

  Future<void> _onFetchPokemonDetails(
      FetchPokemonDetailsEvent event, Emitter<DetailsPageState> emit) async {
    try {
      final pokemonDetails = await pokemonRepository.getPokemon(name: event.id);
      emit(DetailsPageLoaded(pokemon: pokemonDetails));
    } catch (e) {
      emit(DetailsPageError(message: "Error fetching pokemon details"));
    }
  }
}

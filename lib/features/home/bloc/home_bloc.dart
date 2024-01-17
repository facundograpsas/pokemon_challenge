import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/features/home/bloc/home_events.dart';
import 'package:pokemon_challenge/features/home/bloc/home_state.dart';
import 'package:pokemon_challenge/models/pokemon.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({required this.pokemonRepository}) : super(HomePageInitial()) {
    on<FetchPokemonsEvent>(
      _onFetchPokemons,
      transformer: debounceTransformer(),
    );
    on<SearchPokemonEvent>(
      _onSearchPokemon,
    );
    on<FetchPokemonImageEvent>(
      _onFetchPokemonImage,
    );
  }

  EventTransformer<T> debounceTransformer<T>() {
    return (events, mapper) => events
        .debounceTime(const Duration(milliseconds: 1000))
        .asyncExpand(mapper);
  }

  final Map<String, String> pokemonImages = {};
  final PokemonRepository pokemonRepository;
  final int limit = 1500;
  final Set<String> _requestedPokemonNames = {};
  final List<Pokemon> allPokemons = [];

  Future<void> _onFetchPokemons(
      FetchPokemonsEvent event, Emitter<HomePageState> emit) async {
    if (state is HomePageLoaded) return;
    try {
      final newPokemons = await pokemonRepository.getPokemons(
          offset: allPokemons.length, limit: limit);
      allPokemons.addAll(newPokemons);
      emit(HomePageLoaded(pokemons: allPokemons, pokemonImages: pokemonImages));
    } catch (e) {
      emit(HomePageError(message: "Error fetching pokemons"));
    }
  }

  Future<void> _onSearchPokemon(
      SearchPokemonEvent event, Emitter<HomePageState> emit) async {
    if (event.query.isEmpty) {
      emit(HomePageLoaded(pokemons: allPokemons, pokemonImages: pokemonImages));
      return;
    }
    final searchResults = allPokemons
        .where((pokemon) =>
            pokemon.name!.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    if (searchResults.isNotEmpty) {
      emit(HomePageLoaded(
          pokemons: searchResults, pokemonImages: pokemonImages));
    } else {
      emit(
          HomePageError(message: "No Pokémon found matching '${event.query}'"));
    }
  }

  Future<void> _onFetchPokemonImage(
      FetchPokemonImageEvent event, Emitter<HomePageState> emit) async {
    try {
      if (_requestedPokemonNames.contains(event.name)) return;
      _requestedPokemonNames.add(event.name);
      final imageUrl =
          await pokemonRepository.getPokemonImageUrl(event.detailUrl);
      pokemonImages[event.name] = imageUrl;
      emit(HomePageLoaded(
          pokemons: (state as HomePageLoaded).pokemons,
          pokemonImages: pokemonImages));
    } catch (e) {
      return;
    }
  }
}

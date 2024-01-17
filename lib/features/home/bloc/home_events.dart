abstract class HomePageEvent {}

class FetchPokemonsEvent extends HomePageEvent {
  FetchPokemonsEvent(this.offset);
  final int offset;
}

class LoadMorePokemonsEvent extends HomePageEvent {}

class SearchPokemonEvent extends HomePageEvent {
  final String query;
  SearchPokemonEvent(this.query);
}

class FetchPokemonImageEvent extends HomePageEvent {
  final String detailUrl;
  final int pokemonIndex; // Index in the list to update the specific Pokémon
  final String name;

  FetchPokemonImageEvent(this.detailUrl, this.pokemonIndex, this.name);
}

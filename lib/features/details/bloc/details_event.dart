abstract class DetailsPageEvent {}

class FetchPokemonDetailsEvent extends DetailsPageEvent {
  FetchPokemonDetailsEvent(this.id);
  final String id;
}

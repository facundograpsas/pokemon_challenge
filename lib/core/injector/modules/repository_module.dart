import 'package:pokemon_challenge/core/injector/injector.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/data/repositories/pokemon_repository_impl.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<PokemonRepository>(
      () => PokemonRepositoryImpl(
        pokemonApi: injector(),
      ),
    );
  }
}

import 'package:pokemon_challenge/core/injector/injector.dart';
import 'package:pokemon_challenge/core/injector/modules/dio_module.dart';
import 'package:pokemon_challenge/data/api/pokemon_api.dart';
import 'package:pokemon_challenge/data/api/pokemon_api_impl.dart';

class ApiModule {
  ApiModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<PokemonApi>(
      () => PokemonApiImpl(
        injector(instanceName: DioModule.dioInstanceName),
      ),
    );
  }
}

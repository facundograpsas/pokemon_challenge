import 'package:pokemon_challenge/core/injector/injector.dart';
import 'package:pokemon_challenge/features/details/bloc/details_bloc.dart';
import 'package:pokemon_challenge/features/home/bloc/home_bloc.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector
      ..registerLazySingleton<HomePageBloc>(
        () => HomePageBloc(
          pokemonRepository: injector(),
        ),
      )
      ..registerFactory<DetailsPageBloc>(
        () => DetailsPageBloc(
          pokemonRepository: injector(),
        ),
      );
  }
}

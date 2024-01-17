import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/core/injector/modules/api_module.dart';
import 'package:pokemon_challenge/core/injector/modules/bloc_module.dart';
import 'package:pokemon_challenge/core/injector/modules/dio_module.dart';
import 'package:pokemon_challenge/core/injector/modules/repository_module.dart';

class Injector {
  Injector._();
  static GetIt instance = GetIt.instance;

  static void init() {
    DioModule.setup();
    ApiModule.init();
    RepositoryModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}

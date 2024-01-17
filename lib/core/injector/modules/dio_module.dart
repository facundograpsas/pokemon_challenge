import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/configs/app_config.dart';
import 'package:pokemon_challenge/core/injector/injector.dart';

class DioModule {
  DioModule._();

  static const String dioInstanceName = 'dioInstance';
  static final GetIt _injector = Injector.instance;

  static void setup() {
    _setupDio();
  }

  static void _setupDio() {
    _injector.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio(
          BaseOptions(
            baseUrl: AppConfig.baseUrl,
          ),
        );
        return dio;
      },
      instanceName: dioInstanceName,
    );
  }
}

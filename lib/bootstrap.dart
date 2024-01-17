import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:pokemon_challenge/configs/app_config.dart';
import 'package:pokemon_challenge/core/bloc_core/bloc_observer.dart';
import 'package:pokemon_challenge/core/injector/injector.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Injector.init();
  await Injector.instance.allReady();
  AppConfig.configDev();
  Bloc.observer = const AppBlocObserver();

  runApp(await builder());
}

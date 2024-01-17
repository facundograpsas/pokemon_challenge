import 'package:flutter/material.dart';
import 'package:pokemon_challenge/configs/app_config.dart';
import 'package:pokemon_challenge/core/router/app_router.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router,
      locale: Locale(AppConfig.defaultLocale),
    );
  }
}

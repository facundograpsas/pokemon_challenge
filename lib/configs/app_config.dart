class AppConfig {
  static String baseUrl = '';
  static String pokemonsUrl = '';

  static const String defaultLocale = 'es';

  static void configDev() {
    baseUrl = 'https://pokeapi.co/api/v2';
    pokemonsUrl = 'https://pokeapi.co/api/v2/pokemon/';
  }

  static void configTest() {}

  static void configProduction() {}
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String pokemonDeepLinking =
      dotenv.env['POKEMON_DEEP_LINKING_URL'] ?? 'No hay api key';
}

import 'package:miscelaneos/lib_barrel.dart';

class PokemonMapper {
  static Pokemon pokeApiToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokeApiResponse.fromJson(json);

    return Pokemon(
      id: pokeApiPokemon.id,
      name: pokeApiPokemon.name,
      spriteFront: pokeApiPokemon.sprites.other?.officialArtwork.frontDefault,
    );
  }
}

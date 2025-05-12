import 'package:miscelaneos/lib_barrel.dart';


abstract class PokemonsDatasource {
  Future<(Pokemon?, String)> getPokemon(String id);
}

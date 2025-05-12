import 'package:miscelaneos/lib_barrel.dart';


abstract class PokemonsRepository {
  Future<(Pokemon?, String)> getPokemon(String id);
}

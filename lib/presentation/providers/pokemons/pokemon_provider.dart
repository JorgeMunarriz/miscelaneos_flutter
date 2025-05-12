import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/lib_barrel.dart';
import 'package:miscelaneos/repositories/pokemons_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null) return pokemon;

  throw error;
});

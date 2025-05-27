import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/lib_barrel.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;
  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return pokemonAsync.when(
      data: (pokemon) => _PokemonView(pokemon: pokemon),
      error: (error, stackTrace) => _ErrorWidget(message: error.toString()),
      loading: () => _LoadingWidget(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final String host = Environment.pokemonDeepLinking;
    final Uri pokemonUri = Uri.https(host, '/pokemons/${pokemon.id}/');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name[0].toUpperCase() +
              pokemon.name.substring(1).toLowerCase(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(pokemonUri, 'Mire este pokémon');
            },
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront!,
          fit: BoxFit.contain,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;

  const _ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(message)));
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const CircularProgressIndicator()));
  }
}

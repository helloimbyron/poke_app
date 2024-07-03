import 'package:flutter/material.dart';

import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    required this.pokemon,
    super.key,
  });

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(pokemon.image),
          Text(pokemon.name),
        ],
      ),
    );
  }
}

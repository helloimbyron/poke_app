import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonsLocalDataSource {
  Future<bool> capturePokemon(PokemonEntity pokemon);
  Future<List<PokemonModel>> getCapturedPokemonsList();
}

class HivePokemonsLocalDataSourceImpl implements PokemonsLocalDataSource {
  HivePokemonsLocalDataSourceImpl() {
    Hive.initFlutter();
  }

  @override
  Future<bool> capturePokemon(
    PokemonEntity pokemon,
  ) async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(
        pokemon.id,
        PokemonModel.fromEntity(pokemon).toJson(),
      );

      return true;
    } catch (error) {
      debugPrint(error.toString());

      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemonsList() async {
    try {
      Box<dynamic> box = await Hive.openBox('pokemons');

      return box.values
          .map(
            (pokemon) => PokemonModel.fromJson(pokemon),
          )
          .toList();
    } catch (error) {
      debugPrint(error.toString());

      throw LocalFailure();
    }
  }
}

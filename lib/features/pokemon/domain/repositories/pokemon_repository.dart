import 'package:dartz/dartz.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonsRepository {
  Future<Either<Failure, bool>> capturePokemon(
    PokemonEntity pokemon,
  );

  Future<Either<Failure, List<PokemonEntity>>> getCapturedPokemons();

  Future<Either<Failure, PokemonEntity>> searchPokemon(
    int id,
  );
}

import 'package:dartz/dartz.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class CapturePokemonUseCase {
  final PokemonsRepository repository;

  CapturePokemonUseCase({
    required this.repository,
  });

  Future<Either<Failure, bool>> call(
    PokemonEntity pokemon,
  ) {
    return repository.capturePokemon(pokemon);
  }
}

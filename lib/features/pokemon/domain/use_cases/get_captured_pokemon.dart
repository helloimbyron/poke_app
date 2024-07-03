import 'package:dartz/dartz.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetCapturedPokemonsUseCase {
  final PokemonsRepository repository;

  GetCapturedPokemonsUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<PokemonEntity>>> call() {
    return repository.getCapturedPokemons();
  }
}

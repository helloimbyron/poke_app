import 'package:dartz/dartz.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class SearchPokemonUseCase {
  final PokemonsRepository repository;

  SearchPokemonUseCase({
    required this.repository,
  });

  Future<Either<Failure, PokemonEntity>> call(
    int id,
  ) {
    return repository.searchPokemon(id);
  }
}

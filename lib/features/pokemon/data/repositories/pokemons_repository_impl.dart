import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/features/pokemon/data/data_sources/pokemons_local_data_source.dart';
import 'package:poke_app/features/pokemon/data/data_sources/pokemons_remote_data_source.dart';
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonsRepositoryImpl({
    required this.pokemonsLocalDataSource,
    required this.pokemonsRemoteDataSource,
  });

  @override
  Future<Either<Failure, bool>> capturePokemon(
    PokemonEntity pokemon,
  ) async {
    try {
      final bool response = await pokemonsLocalDataSource.capturePokemon(
        pokemon,
      );

      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<PokemonEntity>>> getCapturedPokemons() async {
    try {
      final List<PokemonEntity> response =
          await pokemonsLocalDataSource.getCapturedPokemonsList();

      return Right(response);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> searchPokemon(
    int id,
  ) async {
    try {
      final PokemonEntity response = await pokemonsRemoteDataSource.getPokemon(
        id,
      );

      return Right(response);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}

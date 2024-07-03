import 'package:dio/dio.dart';

import 'package:poke_app/features/pokemon/data/models/pokemon_model.dart';

abstract class PokemonsRemoteDataSource {
  Future<PokemonModel> getPokemon(
    int id,
  );
}

class PokemonsRemoteDataSourceImpl implements PokemonsRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(
    int id,
  ) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/pokemon/$id/',
    );

    return PokemonModel.fromJson(
      response.data,
    );
  }
}

import 'package:get_it/get_it.dart';

import 'package:poke_app/features/pokemon/data/data_sources/pokemons_local_data_source.dart';
import 'package:poke_app/features/pokemon/data/data_sources/pokemons_remote_data_source.dart';
import 'package:poke_app/features/pokemon/data/repositories/pokemons_repository_impl.dart';
import 'package:poke_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/get_captured_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:poke_app/features/pokemon/presentation/blocs/search_pokemon/search_pokemon_bloc.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Bloc
  di.registerFactory(
    () => SearchPokemonBloc(
      di(),
      di(),
      di(),
    ),
  );

  // Use cases
  di.registerLazySingleton(() => CapturePokemonUseCase(repository: di()));
  di.registerLazySingleton(() => GetCapturedPokemonsUseCase(repository: di()));
  di.registerLazySingleton(() => SearchPokemonUseCase(repository: di()));

  // Repository
  di.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDataSource: di(),
      pokemonsRemoteDataSource: di(),
    ),
  );

  // Data sources
  di.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonsLocalDataSourceImpl(),
  );

  di.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}

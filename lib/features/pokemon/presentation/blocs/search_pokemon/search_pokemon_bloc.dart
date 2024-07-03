import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:poke_app/core/errors/failures.dart';
import 'package:poke_app/core/utils/utils.dart' as utils;
import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/get_captured_pokemon.dart';
import 'package:poke_app/features/pokemon/domain/use_cases/search_pokemon.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedPokemonsUseCase _getCapturedsPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  SearchPokemonBloc(
    this._capturePokemonUseCase,
    this._getCapturedsPokemonsUseCase,
    this._searchPokemonUseCase,
  ) : super(SearchPokemonInitial()) {
    on<OnCapturePokemon>(
      (event, emit) async {
        final response = await _capturePokemonUseCase(
          event.pokemon,
        );

        response.fold(
          (failure) => emit(
            SearchPokemonFailure(failure: failure),
          ),
          (pokemon) {},
        );
      },
    );

    on<OnGetCapturedPokemons>(
      (event, emit) async {
        final response = await _getCapturedsPokemonsUseCase();

        response.fold(
          (failure) => emit(
            SearchPokemonFailure(
              failure: failure,
            ),
          ),
          (pokemons) => emit(
            SearchPokemonList(
              pokemons: pokemons,
            ),
          ),
        );
      },
    );

    on<OnSearchPokemon>(
      (event, emit) async {
        emit(SearchPokemonLoading());

        final response = await _searchPokemonUseCase(
          utils.randomPokemonId,
        );

        response.fold(
          (failure) => emit(
            SearchPokemonFailure(failure: failure),
          ),
          (pokemon) => emit(
            SearchPokemonSuccess(pokemon: pokemon),
          ),
        );
      },
    );
  }
}

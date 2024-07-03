import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:poke_app/core/theme/app_theme.dart';
import 'package:poke_app/dependency_injection.dart';
import 'package:poke_app/features/pokemon/presentation/blocs/search_pokemon/search_pokemon_bloc.dart';
import 'package:poke_app/features/pokemon/presentation/screens/pokemons_screen.dart';

void main() async {
  await init();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.instance.get<SearchPokemonBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokemon App',
        theme: appTheme(),
        home: const PokemonsScreen(),
      ),
    );
  }
}

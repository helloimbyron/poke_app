import 'package:poke_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.image,
    required super.name,
  });

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
      id: json['id'],
      image: json['sprites']['front_default'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {
        'front_default': image,
      },
    };
  }

  factory PokemonModel.fromEntity(
    PokemonEntity pokemon,
  ) {
    return PokemonModel(
      id: pokemon.id,
      image: pokemon.image,
      name: pokemon.name,
    );
  }
}

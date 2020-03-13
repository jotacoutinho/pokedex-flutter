import 'dart:async';

import 'package:pokedex/Scenes/Pokedex/DataLayer/pokedex_service.dart';
import 'package:pokedex/Scenes/Pokedex/DataLayer/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc.dart';

class PokedetailBloc implements Bloc {
  final _service = PokedexService();
  final _pokemonDetail = StreamController<PokemonDetailObject>();

  Stream<PokemonDetailObject> get detailStream => _pokemonDetail.stream;

  void fetchPokemonDetail(int index) async {
    final results = await _service.fetchPokemonDetail(index + 1);
    _pokemonDetail.sink.add(results);
  }

  @override
  void dispose() {
    _pokemonDetail.close();
  }
}
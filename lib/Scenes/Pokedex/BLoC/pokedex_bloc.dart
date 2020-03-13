import 'dart:async';

import 'package:pokedex/Scenes/Pokedex/DataLayer/pokedex_service.dart';
import 'package:pokedex/Scenes/Pokedex/DataLayer/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc.dart';

class PokedexBloc implements Bloc {
  final _service = PokedexService();
  final _controller = StreamController<List<Pokemon>>();
  final _showDetail = StreamController<bool>();
  final _pokemonDetail = StreamController<PokemonDetailObject>();

  var currentSelectedPokemon = 0;
  var shouldShowDetail = true;
  Stream<List<Pokemon>> get pokedexStream => _controller.stream;
  Stream<bool> get showDetailStream => _showDetail.stream;

  void fetch() async {
    final results = await _service.fetchAllPokemon();
    _controller.sink.add(results);
  }

  void toggleShowDetail() async {
    shouldShowDetail = !shouldShowDetail;
    _showDetail.sink.add(shouldShowDetail);
  }

  @override
  void dispose() {
    _controller.close();
    _pokemonDetail.close();
    _showDetail.close();
  }
}
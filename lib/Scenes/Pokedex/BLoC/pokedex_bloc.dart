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
  Stream<PokemonDetailObject> get detailStream => _pokemonDetail.stream;
  Stream<bool> get showDetailStream => _showDetail.stream;

  // Stream<int> get currentSelectedStream => _currentSelectedPokemon.stream;

  void fetch() async {
    final results = await _service.fetchAllPokemon();
    _controller.sink.add(results);
  }
 
  // void setCurrentSelectedPokemon(int index) {
  //   _currentSelectedPokemon.sink.add(index);
  // }

  void toggleShowDetail() async {
    shouldShowDetail = !shouldShowDetail;
    print(currentSelectedPokemon);

    if(shouldShowDetail) {
      final results = await _service.fetchPokemonDetail(currentSelectedPokemon + 1);
      _pokemonDetail.sink.add(results);
      _showDetail.sink.add(shouldShowDetail);
    }
  }

  @override
  void dispose() {
    _controller.close();
    _pokemonDetail.close();
    _showDetail.close();
  }
}
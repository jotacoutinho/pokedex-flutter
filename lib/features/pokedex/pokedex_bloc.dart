import 'dart:async';

import 'package:pokedex/features/pokedex/pokedex_service.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc.dart';

class PokedexBloc implements Bloc {
  final _service = PokedexService();
  final _controller = StreamController<List<Pokemon>>();
  // final _currentSelectedPokemon = StreamController<int>();
  final _showDetail = StreamController<bool>();

  var currentSelectedPokemon = 0;
  var _shouldShowDetail = true;
  Stream<List<Pokemon>> get pokedexStream => _controller.stream;
  Stream<bool> get detailStream => _showDetail.stream;
  // Stream<int> get currentSelectedStream => _currentSelectedPokemon.stream;

  void fetch() async {
    final results = await _service.fetchAllPokemon();
    _controller.sink.add(results);
  }

  // void setCurrentSelectedPokemon(int index) {
  //   _currentSelectedPokemon.sink.add(index);
  // }

  void toggleShowDetail() {
    _shouldShowDetail = !_shouldShowDetail;
    _showDetail.sink.add(_shouldShowDetail);
  }

  @override
  void dispose() {
    _controller.close();
    _showDetail.close();
  }
}
import 'dart:async';

import 'package:pokedex/features/pokedex/pokedex_service.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc.dart';

class PokedexBloc implements Bloc {
  final _controller = StreamController<List<Pokemon>>();
  final _service = PokedexService();
  final _showDetail = StreamController<bool>();
  var _shouldShowDetail = true;
  Stream<List<Pokemon>> get pokedexStream => _controller.stream;
  Stream<bool> get detailStream => _showDetail.stream;

  void fetch() async {
    final results = await _service.fetchAllPokemon();
    _controller.sink.add(results);
  }

  void toggleShowDetail() {
    _shouldShowDetail = !_shouldShowDetail;
    _showDetail.sink.add(_shouldShowDetail);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
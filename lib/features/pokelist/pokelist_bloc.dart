import 'dart:async';

import 'package:pokedex/features/pokelist/pokelist_service.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc.dart';

class PokelistBloc implements Bloc {
  final _controller = StreamController<List<Pokemon>>();
  final _service = PokelistService();
  Stream<List<Pokemon>> get pokelistStream => _controller.stream;

  void fetch() async {
    final results = await _service.fetchAllPokemon();
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
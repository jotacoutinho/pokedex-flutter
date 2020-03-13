import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Scenes/Pokedex/BLoC/pokedex_bloc.dart';
import 'package:pokedex/Scenes/Pokedex/DataLayer/pokemon.dart';

class PokelistDisplay extends StatelessWidget {
  final PokedexBloc _bloc;
  final ScrollController _controller;

  PokelistDisplay(this._bloc, this._controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildPokelist(_bloc, _controller),
      margin: EdgeInsets.only(left: 50.0, right: 20.0),
      height: 80.0,
      width: 170.0,
      decoration: new BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
          borderRadius: new BorderRadius.all(Radius.circular(10.0)),
          color: Colors.green)
    );
  }

  Widget _buildPokelist(PokedexBloc bloc, ScrollController controller) {
    bloc.fetch();

    return StreamBuilder<List<Pokemon>>(
      stream: bloc.pokedexStream,
      builder: (context, snapshot) {
        final list = snapshot.data;
        if (list == null) {
          print("null pokemon list");
          return Container();
        } else if (list.isEmpty) {
          print("empty pokemon list");
          return Container();
        } else {
          return _buildList(list, controller, bloc.currentSelectedPokemon);
        }
      }
    );
  }

  Widget _buildList(List<Pokemon> list, ScrollController controller, int current) {
    double itemSize = 67.0;

    return IgnorePointer(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final pokemon = list[index];
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            height: itemSize,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text("${index + 1}. ${pokemon.name.toUpperCase()}", style: TextStyle(fontSize: 16)),
              padding: EdgeInsets.only(top: 8.0),
              color: Colors.black12,
              height: 38.0,
            )
          );
        },
      )
    );
  }
}
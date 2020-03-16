import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Scenes/Pokedex/BLoC/pokedex_bloc.dart';

class PokelistSelector extends StatelessWidget {
  double _itemSize = 67.0;
  double _imageSize = 250.0;
  PokedexBloc _bloc;
  ScrollController _pokelistController;
  ScrollController _imageListController;

  PokelistSelector(this._bloc, this._pokelistController, this._imageListController);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, top: 20.0),
        width: 150.0,
        height: 200.0,
        child: Row(
          children: [Column(
            children: [
              FlatButton.icon(
                label: Text(""),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.arrow_drop_up, size: 75.0),
                color: Colors.red,
                onPressed: () {
                  _seekPokemonList(false);
                }),
              FlatButton.icon(
                label: Text(""),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.arrow_drop_down, size: 75.0),
                color: Colors.red,
                onPressed: () {
                  _seekPokemonList(true);
                }),
            ]),
          ])
      );
  }

  _seekPokemonList(bool forward) {
    _bloc.currentSelectedPokemon += forward ? 1 : -1;
    if(_bloc.currentSelectedPokemon < 0) {
      _bloc.currentSelectedPokemon = 0;
    } else if(_bloc.currentSelectedPokemon > 150) {
      _bloc.currentSelectedPokemon = 150;
    }

    var itemOffset = _bloc.currentSelectedPokemon * _itemSize;
    var imageOffset = _bloc.currentSelectedPokemon * _imageSize;

    _pokelistController.animateTo(itemOffset, duration: Duration(milliseconds: 100), curve: Curves.linear);
    _imageListController.animateTo(imageOffset, duration: Duration(milliseconds: 100), curve: Curves.linear);
  }
}
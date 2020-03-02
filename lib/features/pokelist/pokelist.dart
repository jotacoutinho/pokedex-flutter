import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widgets/platform_scaffold.dart';
import 'package:pokedex/features/pokelist/pokelist_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc_provider.dart';

class Pokelist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = PokelistBloc();
    int _currentSelectedPokemon = 0;
    double _itemSize = 67.0;
    double _imageSize = 250.0;
    ScrollController _pokelistController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
    ScrollController _imageListController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);

    _seekPokemonList(bool forward){
      _currentSelectedPokemon += forward ? 1 : -1;
      if(_currentSelectedPokemon < 0) {
        _currentSelectedPokemon = 0;
      } else if(_currentSelectedPokemon > 150) {
        _currentSelectedPokemon = 150;
      }

      var itemOffset = _currentSelectedPokemon * _itemSize;
      var imageOffset = _currentSelectedPokemon * _imageSize;

      _pokelistController.animateTo(itemOffset, duration: Duration(milliseconds: 100), curve: Curves.linear);
      _imageListController.animateTo(imageOffset, duration: Duration(milliseconds: 100), curve: Curves.linear);
    }

    return BlocProvider<PokelistBloc>(
      bloc: bloc,
      child: PlatformScaffold(
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              Row(   
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    margin: EdgeInsets.only(bottom: 20.0, left: 40.0, right: 40.0, top: 0.0),
                    decoration: new BoxDecoration(
                      border: Border.all(width: 4.0, color: Colors.white, style: BorderStyle.solid),
                      borderRadius: new BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.blue)),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      margin: EdgeInsets.only(top: 10.0, right: 10.0),
                      decoration: new BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.red)),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      margin: EdgeInsets.only(top: 10.0, right: 10.0),
                      decoration: new BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.yellow)),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: new BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                        borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.green)
                    )]
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: _buildCurrentPokemonImage(_currentSelectedPokemon, _imageListController),
                    margin: EdgeInsets.only(top: 10.0),
                    height: 250.0,
                    width: 250.0,
                    decoration: new BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                        borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(50.0)),
                        color: Colors.lightBlueAccent)
                  )] 
              ),
              Container(
                height: 50.0,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.0),
                child: 
                  IconButton(
                    icon: Icon(Icons.info),
                    iconSize: 50.0,
                    color: Colors.black,
                    onPressed: () {
                      // TODO show detail
                    }
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        child: _buildPokelist(bloc, _pokelistController, _currentSelectedPokemon),
                        margin: EdgeInsets.only(left: 50.0, right: 20.0),
                        height: 80.0,
                        width: 170.0,
                        decoration: new BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                            borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.green)
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.0, top: 20.0),
                        width: 150.0,
                        height: 200.0,
                        child: Row(
                          children: [Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_drop_up),
                                iconSize: 75.0,
                                color: Colors.black,
                                onPressed: () {
                                  _seekPokemonList(false);
                                }),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 75.0,
                                color: Colors.black,
                                onPressed: () {
                                  _seekPokemonList(true);
                                }),
                            ]),
                          ])
                      )]
                  )] 
              )],
          )
        ) 
      )
    );
  } 

  Widget _buildCurrentPokemonImage(int index, ScrollController controller) {
    return IgnorePointer(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        itemCount: 151,
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            height: 250.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image(image: ResizeImage(NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png"), width: 250, height: 250)),
            )
          );
        },
      )
    );
  }

  Widget _buildPokelist(PokelistBloc bloc, ScrollController controller, int currentSelectedPokemon) {
    bloc.fetch();

    return StreamBuilder<List<Pokemon>>(
      stream: bloc.pokelistStream,
      builder: (context, snapshot) {
        final list = snapshot.data;
        if (list == null) {
          print("null pokemon list");
          return Container();
        } else if (list.isEmpty) {
          print("empty pokemon list");
          return Container();
        } else {
          return _buildList(list, controller, currentSelectedPokemon);
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
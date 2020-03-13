import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Scenes/Pokedex/BLoC/pokedex_bloc.dart';
import 'package:pokedex/Scenes/Pokedex/DataLayer/pokemon.dart';

class Pokedetail extends StatelessWidget {
  final _index = 0;
  final bloc = PokedexBloc();

  // Pokedetail(this.detail);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 250.0,
          width: 250.0,
          decoration: new BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
              borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(50.0)),
              color: Colors.lightBlueAccent),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ 
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PokemonImage(_index),
                  PokemonInfo(),
                ],
              ),
              PokemonStats()
            ],
          )
        )] 
    );  
  }
}

class PokemonStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      decoration: new BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                      borderRadius: new BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.grey[100]),
      child: Row(
        children: [
          Container(
            width: 100.0, 
            height: 100.0, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(child: Text("HP: 48"), padding: EdgeInsets.only(top: 1.0, left: 2.0)),
                Container(child: Text("Attack: 78"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Defense: 150"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Sp. Atk: 150"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Sp. Def: 48"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Speed: 300"), padding: EdgeInsets.only(left: 2.0, bottom: 1.0)),
              ],
            )
          ), 
          Container(
            width: 100.0, 
            height: 100.0, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(color: Colors.red, width: (48 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 3.0, bottom: 2.0)),
                Container(color: Colors.orange, width: (78 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.amber, width: (150 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.blue, width: (150 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.green, width: (48 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.pinkAccent, width: (300 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
              ],
            )
          )]
      )
    );
  }
}

class PokemonImage extends StatelessWidget {
  final _index;

  PokemonImage(this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.0,
      height: 105.0,
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
        borderRadius: new BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0), bottomRight: Radius.circular(25.0), bottomLeft: Radius.circular(5.0)),
        color: Colors.grey[100]),
      alignment: Alignment.center,
      margin: EdgeInsets.all(10.0),
      child: Image(image: ResizeImage(NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_index + 1}.png"), width: 105, height: 105))
    );
  }
}

class PokemonInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113.0,
      height: 92.0,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 10.0, right: 10.0),
      child: Column(
        children: [
          _buildNameContainer(context),
          _buildSpeciesInfo(context),
          Container(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.lightBlueAccent,
            alignment: Alignment.center,
          ),
          _buildTypeInfo(context)
        ],
      ),
    );
  }

  _buildNameContainer(BuildContext context) {
    return Container(
      child: Container(child: Text("#1 Bulbasaur"), padding: EdgeInsets.only(left: 5.0, right: 5.0), height: 20.0,),
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
        borderRadius: new BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        color: Colors.red),
    );
  }

  _buildSpeciesInfo(BuildContext context) {
    return Container(
      child: Container(child: Text("HT: 1 WT: 50"), height: 28.0, padding: EdgeInsets.only(top: 5.0)),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
        borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
        color: Colors.grey[100]),
    );
  }

  _buildTypeInfo(BuildContext context) {
    return Container(
      height: 25.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: 18.0,
            width: 50.0,
            margin: EdgeInsets.only(left: 5.0),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
              borderRadius: new BorderRadius.all(Radius.circular(6.0)),
              color: Colors.amber),
            alignment: Alignment.center,
            child: Text("ELECTRIC", style: TextStyle(fontSize: 10, color: Colors.white)),
          ),
          Container(
            height: 18.0,
            width: 50.0,
            margin: EdgeInsets.only(left: 3.0),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
              borderRadius: new BorderRadius.all(Radius.circular(6.0)),
              color: Colors.purple),
            alignment: Alignment.center,
            child: Text("POISON", style: TextStyle(fontSize: 10, color: Colors.white)),
          )
        ],
      ),
    );
  }
}
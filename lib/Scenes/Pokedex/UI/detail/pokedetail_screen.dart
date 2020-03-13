import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Scenes/Pokedex/BLoC/pokedetail_bloc.dart';
import 'package:pokedex/Scenes/Pokedex/DataLayer/pokemon.dart';

class Pokedetail extends StatelessWidget {
  final _index;
  final bloc = PokedetailBloc();

  Pokedetail(this._index);

  @override
  Widget build(BuildContext context) {
    bloc.fetchPokemonDetail(_index);

    return StreamBuilder<PokemonDetailObject>(
      stream: bloc.detailStream,
      builder: (context, snapshot) {
        final detail = snapshot.data;
        if (detail == null) {
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
                  color: Colors.lightBlueAccent)
            )] 
          );
        } else {
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
                        PokemonInfo(detail.id, detail.name, detail.height, detail.weight, detail.types),
                      ],
                    ),
                    PokemonStats(detail.stats)
                  ],
                )
              )] 
          );  
        }
      },
    );
  }
}

class PokemonStats extends StatelessWidget {
  final List<PokemonStatus> stats;

  PokemonStats(this.stats);

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
                Container(child: Text("HP: ${stats[5].base_stat}"), padding: EdgeInsets.only(top: 1.0, left: 2.0)),
                Container(child: Text("Attack: ${stats[4].base_stat}"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Defense: ${stats[3].base_stat}"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Sp. Atk: ${stats[2].base_stat}"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Sp. Def: ${stats[1].base_stat}"), padding: EdgeInsets.only(left: 2.0)),
                Container(child: Text("Speed: ${stats[0].base_stat}"), padding: EdgeInsets.only(left: 2.0, bottom: 1.0)),
              ],
            )
          ), 
          Container(
            width: 100.0, 
            height: 100.0, 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(color: Colors.red, width: (stats[5].base_stat * 100 / 250), height: 12.0, margin: EdgeInsets.only(top: 3.0, bottom: 2.0)),
                Container(color: Colors.orange, width: (stats[4].base_stat * 100 / 134), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.amber, width: (stats[3].base_stat * 100 / 180), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.blue, width: (stats[2].base_stat * 100 / 154), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.green, width: (stats[1].base_stat * 100 / 154), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                Container(color: Colors.pinkAccent, width: (stats[0].base_stat * 100 / 140), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
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
  final int id;
  final String name;
  final int height;
  final int weight;
  final List<PokemonTypes> types;

  PokemonInfo(this.id, this.name, this.height, this.weight, this.types);

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
      child: Container(child: Text("#${id} ${name.toUpperCase()}", style: TextStyle(fontSize: 12.0),), padding: EdgeInsets.only(left: 5.0, right: 5.0), height: 20.0, alignment: Alignment.center,),
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
        borderRadius: new BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
        color: Colors.red),
    );
  }

  _buildSpeciesInfo(BuildContext context) {
    return Container(
      child: Container(child: Text("HT: ${height} WT: ${weight}", style: TextStyle(fontSize: 12.0)), height: 28.0, padding: EdgeInsets.only(top: 5.0)),
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
        children:
          types.reversed.map<Widget>((type) => Container(
            height: 18.0,
            width: 50.0,
            margin: EdgeInsets.only(left: 5.0),
            decoration: new BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
              borderRadius: new BorderRadius.all(Radius.circular(6.0)),
              color: _getTypeBadgeColor(type.type.name)),
            alignment: Alignment.center,
            child: Text("${type.type.name.toUpperCase()}", style: TextStyle(fontSize: 10, color: Colors.white)),
          )).toList()
      ),
    );
  }

  _getTypeBadgeColor(String type) {
    switch(type.toUpperCase()) {
      case "NORMAL":
        return Colors.grey;
      case "POISON":
        return Colors.purple;
      case "PSYCHIC":
        return Colors.pink;
      case "GRASS":
        return Colors.green;
      case "GROUND":
        return Colors.amber;
      case "ICE":
        return Colors.lightBlueAccent[100];
      case "FIRE":
        return Colors.red;
      case "ROCK":
        return Colors.brown[300];
      case "DRAGON":
        return Colors.blueAccent;
      case "WATER":
        return Colors.blue;
      case "BUG":
        return Colors.lightGreen;
      case "DARK":
        return Colors.brown;
      case "FIGHTING":
        return Colors.deepOrange;
      case "GHOST":
        return Colors.deepPurple;
      case "STEEL":
        return Colors.blueGrey[200];
      case "FLYING":
        return Colors.blue[200];
      case "ELECTRIC":
        return Colors.amberAccent;
      case "FAIRY":
        return Colors.pink[100];
      default:
        return Colors.black;
    }
  }
}
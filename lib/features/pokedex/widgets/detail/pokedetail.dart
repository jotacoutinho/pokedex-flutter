import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widgets/platform_scaffold.dart';
import 'package:pokedex/features/pokedex/pokedex_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc_provider.dart';

class Pokedetail extends StatelessWidget {

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
                  color: Colors.lightBlueAccent)
            )] 
    );  
  }
}
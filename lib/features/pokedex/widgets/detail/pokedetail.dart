import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widgets/platform_scaffold.dart';
import 'package:pokedex/features/pokedex/pokedex_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/shared/blocs/bloc_provider.dart';

class Pokedetail extends StatelessWidget {
  final _index = 0;

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
                  Container(
                    width: 105.0,
                    height: 105.0,
                    decoration: new BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                      borderRadius: new BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0), bottomRight: Radius.circular(25.0), bottomLeft: Radius.circular(5.0)),
                      color: Colors.grey[100]),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10.0),
                    child: Image(image: ResizeImage(NetworkImage("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${_index + 1}.png"), width: 105, height: 105))
                  ),
                  Container(
                    width: 113.0,
                    height: 92.0,
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Container(
                          child: Container(child: Text("#1 Bulbasaur"), padding: EdgeInsets.only(left: 5.0, right: 5.0), height: 20.0,),
                          width: MediaQuery.of(context).size.width,
                          decoration: new BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                            borderRadius: new BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                            color: Colors.red),
                        ),
                        Container(
                          child: Container(child: Text("HT: 1 WT: 50"), height: 28.0, padding: EdgeInsets.only(top: 5.0)),
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: new BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.black, style: BorderStyle.solid),
                            borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            color: Colors.grey[100]),
                        ),
                        Container(
                          height: 10.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.lightBlueAccent,
                          alignment: Alignment.center,
                        ),
                        Container(
                          height: 25.0,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
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
                          Container(color: Colors.red, width: (48 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                          Container(color: Colors.orange, width: (78 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                          Container(color: Colors.amber, width: (150 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                          Container(color: Colors.blue, width: (150 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                          Container(color: Colors.green, width: (48 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                          Container(color: Colors.pinkAccent, width: (300 * 100 / 300), height: 12.0, margin: EdgeInsets.only(top: 2.0, bottom: 2.0)),
                        ],
                      )
                    )]
              ))
            ],
          )
        )] 
    );  
  }
}
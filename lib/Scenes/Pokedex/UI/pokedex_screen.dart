import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_widgets/platform_scaffold.dart';
import 'package:pokedex/shared/blocs/bloc_provider.dart';
import 'package:pokedex/Scenes/Pokedex/UI/detail/pokedetail_screen.dart';
import 'package:pokedex/Scenes/Pokedex/BLoC/pokedex_bloc.dart';
import 'package:pokedex/Scenes/Pokedex/UI/list/pokelist_selector_widget.dart';
import 'package:pokedex/Scenes/Pokedex/UI/list/pokelist_display_widget.dart';

class Pokedex extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = PokedexBloc();
    ScrollController _pokelistController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
    ScrollController _imageListController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);

    return BlocProvider<PokedexBloc>(
      bloc: bloc,
      child: PlatformScaffold(
        child: Container(
          color: Colors.red,
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              PokedexHeader(),
              PokedexDisplay(bloc, _imageListController),
              PokemonInfoButton(bloc),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      PokelistDisplay(bloc, _pokelistController),
                      PokelistSelector(bloc, _pokelistController, _imageListController)]
                  )] 
              )],
          )
        ) 
      )
    );
  }   
}  

class PokemonInfoButton extends StatelessWidget {
  final PokedexBloc bloc;

  PokemonInfoButton(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.0),
      child: 
        FlatButton.icon(
          label: Text(""),
          icon: Icon(Icons.info, size: 50.0,),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          color: Colors.red,
          onPressed: () {
            bloc.toggleShowDetail();
          }
        )
    );
  }
}

class PokedexDisplay extends StatelessWidget {
  final PokedexBloc bloc;
  final ScrollController imageListController;

  PokedexDisplay(this.bloc, this.imageListController);

  @override
  Widget build(BuildContext context) {
    // Triggering show detail to add value to stream (true -> false), making detail hidden at init
    bloc.toggleShowDetail();
    
    return StreamBuilder<bool>(
      stream: bloc.showDetailStream,
      builder: (context, snapshot) {
      final showDetail = snapshot.data;
      if(showDetail) {
         return Pokedetail(bloc.currentSelectedPokemon);
      } else {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: _buildCurrentPokemonImage(bloc.currentSelectedPokemon, imageListController),
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
    });
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
}

class PokedexHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(   
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
    );
  }
}
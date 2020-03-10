import 'dart:async';
import 'dart:convert' show json;
import 'package:pokedex/Network/api_service.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexService {
  ApiService api = ApiService();
  String _getPokemonList = 'pokemon?limit=151';

  Future<List<Pokemon>> fetchAllPokemon() async {
    String response = await api.fetchData(_getPokemonList);
    List<Pokemon> pokemonList = _parsePokemonList(response);

    if (pokemonList != null) {
      return pokemonList;
    } else {
      print(response);
    }
  }

  List<Pokemon> _parsePokemonList(String response) {
    final data = json.decode(response);
    final pokemonList = data['results'].map<Pokemon>((json) => Pokemon.fromJson(json)).toList();

    return pokemonList;
  }
}
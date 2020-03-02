class PokemonList {
  final int count;
  final String next;
  final bool previous;
  final List<Pokemon> results;

  PokemonList.fromJson(Map json)
        : count = json['count'],
        next = json['next'],
        previous = json['previous'],
        results = json['results'];
}

class Pokemon {
  final String name;
  final String url;

  Pokemon.fromJson(Map json)
      : name = json['name'],
      url = json['url'];
}
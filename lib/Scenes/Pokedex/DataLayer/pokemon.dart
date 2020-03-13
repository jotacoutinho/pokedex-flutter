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

class PokemonDetailObject {
  final int id;
  final String name;
  final List<PokemonStatus> stats;
  final List<PokemonTypes> types;
  final int height;
  final int weight;

  // PokemonDetailObject(this.id, this.name, this.stats, this.types, this.height, this.weight);
  PokemonDetailObject.fromJson(Map json)
      : id = json['id'],
      name = json['name'],
      stats = json['stats'].map<PokemonStatus>((json) => PokemonStatus.fromJson(json)).toList(),
      types = json['types'].map<PokemonTypes>((json) => PokemonTypes.fromJson(json)).toList(),
      height = json['height'],
      weight = json['weight'];
}

class PokemonDetail {
  final List<String> abilities;
  final int base_experience;
  final List<String> forms;
  final List<String> game_indices;
  final int height;
  final List<String> held_items;
  final int id;
  final bool is_default;
  final String location_area_encounters;
  final List<String> moves;
  final String name;
  final int order;
  final List<String> species;
  final List<String> spites;
  final List<PokemonStatus> stats;
  final List<PokemonTypes> types;
  final int weight;

  PokemonDetail.fromJson(Map json)
      : abilities = json['abilities'],
      base_experience = json['base_experience'],
      forms = json['forms'],
      game_indices = json['game_indices'],
      height = json['height'],
      held_items = json['held_items'],
      id = json['id'],
      is_default = json['is_default'],
      location_area_encounters = json['location_area_encounters'],
      moves = json['moves'],
      name = json['name'],
      order = json['order'],
      species = json['species'],
      spites = json['spites'],
      stats = json['stats'],
      types = json['types'],
      weight = json['weight'];
}

class PokemonStatus {
  final int base_stat;
  final int effort;
  final PokemonStat stat;

  PokemonStatus.fromJson(Map json)
    : base_stat = json['base_stat'],
    effort = json['effort'],
    stat = PokemonStat.fromJson(json['stat']);
}

class PokemonStat {
  final String name;
  final String url;

  PokemonStat.fromJson(Map json)
    : name = json['name'],
    url = json['url'];
}

class PokemonTypes {
  final int slot;
  final PokemonType type;

  PokemonTypes.fromJson(Map json)
    : slot = json['slot'],
    type = PokemonType.fromJson(json['type']);
}

class PokemonType {
  final String name;
  final String url;

  PokemonType.fromJson(Map json)
    : name = json['name'],
    url = json['url'];
}
class PokemonHub {
  late String id;
  late String name;
  late String img;
  late String height;
  late String weight;
  late String candy;
  late String egg;

  PokemonHub({required this.id, required this.name, required this.img});

  PokemonHub.fromjson(Map<String, dynamic> map) {
    id = map["id"].toString();
    name = map["name"];
    img = map["img"];
    height = map["height"];
    weight = map["weight"];
    candy = map["candy"];
    // egg = map[" egg"];
  }
}

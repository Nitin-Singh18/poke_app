// ignore_for_file: file_names, empty_constructor_bodies, camel_case_types

class PokemonHub {
  late String id;
  late String name;
  late String img;
  late String height;
  late String weight;
  late String candy;
  late String candyCount;
  late List<String> type;
  late List<String> weaknesses;
  late List<Next_Evo> nextEvo;

  PokemonHub(
      {required this.id,
      required this.name,
      required this.img,
      required this.height,
      required this.weight,
      required this.candy,
      required this.candyCount,
      required this.type,
      required this.weaknesses,
      required this.nextEvo});

  factory PokemonHub.fromjson(Map<String, dynamic> map) {
    return PokemonHub(
        id: map["id"].toString(),
        name: map["name"],
        img: map["img"],
        height: map["height"],
        weight: map["weight"],
        candy: map["candy"],
        candyCount: map['candy_count'].toString(),
        type: map['type'].cast<String>(),
        weaknesses: map['weaknesses'].cast<String>(),
        nextEvo: ((map['next_evolution'] ?? []) as List)
            .map((e) => Next_Evo.fromjson(e))
            .toList());
  }
}

class Next_Evo {
  late String num;
  late String name;
  Next_Evo({required this.num, required this.name});

  factory Next_Evo.fromjson(Map<String, dynamic> map) {
    return Next_Evo(num: map['num'], name: map['name']);
  }
}

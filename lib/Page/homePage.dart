// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/Model/pokemonModel.dart';
import 'package:poke_app/Page/pokemonDetailPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PokemonHub> pokemon = [];

  bool isLoading = true;

  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  @override
  void initState() {
    super.initState();
    mergeData();
  }

  void mergeData() async {
    pokemon = await fetchData();
    isLoading = false;
    setState(() {});
  }

  Future<List<PokemonHub>> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List data1 = data["pokemon"];
      return data1.map((e) => PokemonHub.fromjson(e)).toList();
    } else {
      throw Exception("Failed to load Data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pokedex"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: !isLoading
            ? GridView.builder(
                itemCount: pokemon.isNotEmpty ? 50 : 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokemonDetail(),
                              settings:
                                  RouteSettings(arguments: pokemon[index])));
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                pokemon[index].img,
                              )
                              // CachedNetworkImage(
                              //   imageUrl: pokemon[index].img,
                              //   imageBuilder: (context, imageProvider) =>
                              //       Container(
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //         image: imageProvider,
                              //         fit: BoxFit.cover,
                              //       ),
                              //     ),
                              //   ),
                              //   placeholder: (context, url) =>
                              //       CircularProgressIndicator(),
                              //   errorWidget: (context, url, error) =>
                              //       Icon(Icons.error),
                              // ),
                              ),
                          Text(
                            pokemon[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}

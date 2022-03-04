// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:poke_app/Model/pokemonModel.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemon1 = ModalRoute.of(context)!.settings.arguments as PokemonHub;
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Stack(
        children: [
          Positioned(
            top: 150,
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    pokemon1.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  Text(
                    "Height : ${pokemon1.height}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Height : ${pokemon1.weight}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Candy Count : ${pokemon1.candyCount}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text("Types",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon1.type
                        .map((e) => FilterChip(
                            backgroundColor: Colors.orange.shade300,
                            label: Text(e),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Weakness",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon1.type
                        .map((e) => FilterChip(
                            backgroundColor: Colors.orange.shade400,
                            label: Text(e),
                            onSelected: (b) {}))
                        .toList(),
                  ),
                  Text("Next Evolution",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon1.nextEvo == null
                        ? <Widget>[Text("Final Form")]
                        : pokemon1.nextEvo
                            .map((e) => FilterChip(
                                backgroundColor: Colors.orange.shade500,
                                label: Text(e.name),
                                onSelected: (b) {}))
                            .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon1.img,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(pokemon1.img))),
                )),
          )
        ],
      ),
    );
  }
}

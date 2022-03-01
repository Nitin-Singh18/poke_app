// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

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
        appBar: AppBar(
          title: Text(pokemon1.name),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyan,
        ),
        body: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Text(pokemon1.name),
                  Text("Height : ${pokemon1.height}"),
                  Text("Height : ${pokemon1.weight}")
                ],
              ),
            ),
          ],
        ));
  }
}

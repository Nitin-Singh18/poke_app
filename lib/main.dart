import 'package:flutter/material.dart';

import 'Page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:game_app/giveaways_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Giveaways',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GiveawaysPage(),
    );
  }
}

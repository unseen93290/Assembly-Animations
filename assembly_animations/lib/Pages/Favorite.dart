import 'package:assembly_animations/CustomWidgets/CardFavorite.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            CardFavorite(
              image: "Assets/Images/dooble.jpg",
              nom: "Dooble",
            ),
            CardFavorite(
              image: "Assets/Images/Drapeau.jpg",
              nom: "Drapeau",
            )
          ],
        ),
      ),
    );
  }
}

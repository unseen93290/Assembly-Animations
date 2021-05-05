import 'package:assembly_animations/CustomWidgets/CardFavorite.dart';
import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:flutter/material.dart';
import '';

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
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            children: [
              //TODO Voir widget disimille pour suprimer une chose d'un balayage de doigt

              CardFavorite(
                image: "Assets/Images/DoobleLogo.png",
                nom: "Dooble",
              ),

              CardFavorite(
                image: "Assets/Images/Drapeau.jpg",
                nom: "Drapeau",
              ),
              CardFavorite(
                image: "Assets/Images/DrapeauLogo.png",
                nom: "Drapeau",
              ),
              CardFavorite(
                image: "Assets/Images/Drapeau.jpg",
                nom: "Drapeau",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

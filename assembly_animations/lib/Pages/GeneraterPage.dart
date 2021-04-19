import 'package:flutter/material.dart';
import 'ActivitesDescription.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Home.dart';
import '../CustomWidgets/IconsBarNavigation.dart';
import 'Parametres.dart';
import 'Messages.dart';
import 'Favorite.dart';
import 'AjoutActivites.dart';

class GeneraterPage extends StatefulWidget {
  @override
  _GenraterPageState createState() => _GenraterPageState();
}

class _GenraterPageState extends State<GeneraterPage> {
  // il faut mettre la page a 2 pour pouvoir tomber sur la page home directement avant le setstate
  int page = 2;

  //Creation d'une liste pour passé de page en page
  final PageOption = [
    Messages(),
    Favorite(),
    Home(),
    AjoutActivites(),
    Parametres(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //curvedNavigation gere la barre de navigation situé en bas
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 100),
        height: 65,
        backgroundColor: Colors.white,
        //index represente la position ou l'on se trouve au debut
        index: 2,
        onTap: (index) {
          print(index);
          setState(() {
            page = index;
          });
        },
        items: <Widget>[
          IconsBarNavigation(icon: Icons.message, nom: "Message"),
          IconsBarNavigation(icon: Icons.favorite, nom: "Favoris"),
          IconsBarNavigation(icon: Icons.home, nom: "Home"),
          IconsBarNavigation(icon: Icons.add_circle_outline, nom: "Ajouter"),
          IconsBarNavigation(icon: Icons.settings, nom: "Parametre"),
        ],
      ),
      // On va dans page option et on choisit l'index de page ce qui nous renvoi a nos page cree
      body: PageOption[page],
    );
  }
}

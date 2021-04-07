import 'package:flutter/material.dart';
import 'ActivitesDescription.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'PageAccueil.dart';
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
  int page = 0;

  final PageOption = [
    PageAcceuil(),
    //Messages(),
    Favorite(),
    //AjoutActivites(),
    //Parametres(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 100),
        height: 65,
        backgroundColor: Colors.white,
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
      body: PageOption[page],
    );
  }
}

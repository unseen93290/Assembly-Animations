import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ActivitesDescription.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Home.dart';
import '../CustomWidgets/IconsBarNavigation.dart';
import 'Parametres.dart';
import 'Messages.dart';
import 'Favorite.dart';
import 'AjoutActivites.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GeneraterPage extends StatefulWidget {
  @override
  _GenraterPageState createState() => _GenraterPageState();
}

class _GenraterPageState extends State<GeneraterPage> {
  final _auth = FirebaseAuth.instance;
  var loggedInUser;
  // il faut mettre la page a 2 pour pouvoir tomber sur la page home directement avant le setstate
  int page = 2;

  @override

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
        //TODO Voir comment redessendre le boutton car dans activiter description sa gene le text + parametre quand on est dans la page le e depasse
        animationCurve: Curves.slowMiddle,
        animationDuration: Duration(milliseconds: 100),
        height: 65,
        color: Colors.white70,
        buttonBackgroundColor:
            Colors.transparent, //Theme.of(context).primaryColor,
        backgroundColor: Color(0xffDD985C),
        //index represente la position ou l'on se trouve au debut
        index: 2,
        onTap: (index) {
          print(index);
          setState(() {
            page = index;
          });
        },
        //TODO Voir coment retirer le cerce autour des boutton
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

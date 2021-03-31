import 'package:flutter/material.dart';
import 'ActivitesDescription.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'PageAccueil.dart';
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
    ActivitesDescription(),
    //Messages(),
    //Favorite(),
    //AjoutActivites(),
    //Parametres(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 100),
        height: 50,
        backgroundColor: Colors.white,
        index: 0,
        onTap: (index) {
          print(index);
          setState(() {
            page = index;
          });
        },
        items: <Widget>[
          Icon(Icons.message, size: 30, color: Colors.black),
          Icon(Icons.favorite, size: 30, color: Colors.black),
          Icon(Icons.add, size: 30, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
      ),
      body: PageOption[page],
    );
  }
}

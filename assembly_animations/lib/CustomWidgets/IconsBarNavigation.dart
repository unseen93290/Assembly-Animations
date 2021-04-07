import 'package:flutter/material.dart';

class IconsBarNavigation extends StatelessWidget {
  final String nom;
  var icon;

  IconsBarNavigation({this.nom, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Icon(icon, size: 30, color: Colors.black),
          Text(nom),
        ],
      ),
    );
  }
}

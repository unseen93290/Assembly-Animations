import 'dart:core';

import 'package:flutter/material.dart';

class ImagesActivites extends StatelessWidget {
  var image;
  var nom;
  var nombreJoueurs;
  var but;
  var materiel;
  var deroulement;
  Function onTap;

  ImagesActivites(
      {this.image,
      this.onTap,
      this.nom,
      this.but,
      this.deroulement,
      this.materiel,
      this.nombreJoueurs});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      // ClipRREct Permet de rendre l'image arrondi
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}

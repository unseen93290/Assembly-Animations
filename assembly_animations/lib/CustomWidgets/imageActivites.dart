import 'dart:core';

import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:flutter/material.dart';

class ImagesActivites extends StatelessWidget {
  final String image;
  final String nom;
  final String nombreJoueurs;
  final String but;
  final String materiel;
  final String deroulement;
  final String imageLogo;
  final String age;
  Function onTap;

  ImagesActivites(
      {this.image,
      this.onTap,
      this.nom,
      this.but,
      this.deroulement,
      this.materiel,
      this.nombreJoueurs,
      this.imageLogo,
      this.age});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return ActivitesDescription(
              nombreJoueurs: nombreJoueurs,
              image: image,
              nom: nom,
              but: but,
              deroulement: deroulement,
              materiel: materiel,
              imageLogo: imageLogo,
              age: age);
        }));
      },
      child: Container(
        margin: EdgeInsets.all(12),
        // ClipRREct Permet de rendre l'image arrondi
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}

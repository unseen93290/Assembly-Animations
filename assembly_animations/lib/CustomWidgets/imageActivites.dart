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
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 10),
        alignment: Alignment.topLeft,
        width: 200,
        height: 200,
        child: InkWell(
          onTap: (onTap),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

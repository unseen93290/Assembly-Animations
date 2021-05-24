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
        Navigator.push(
            context,
            PageRouteBuilder(
                //Permet de cree une animation de page
                transitionDuration: Duration(milliseconds: 400),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secAnimation,
                    Widget child) {
                  var begin = Offset(0.0, 1.0);
                  //les offset comprene les x et les y les y representer par 1 indique qu'on par du bas car 0x est la parti du haut
                  var end = Offset.zero;
                  var tween = Tween(
                      begin: begin,
                      end:
                          end); //tween permet de mettre deux chose en meme temps niveau animation il ne faut pas oublier le chain pour l'animation je l'utilise pas car j'ai duration la haut
                  return SlideTransition(
                    // l'animation par du bas vers le haut
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secAnimation) {
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

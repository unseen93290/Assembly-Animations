import 'package:flutter/material.dart';

import '../Tools/ListImageActivites.dart';
import '../Tools/Const.dart';
import '../CustomWidgets/CardActivitesDescription.dart';
import '../CustomWidgets/DeroulerActivite.dart';

class ActivitesDescription extends StatelessWidget {
  final String image;
  final String nom;
  final String but;
  final String nombreJoueurs;
  final String materiel;
  final String deroulement;
  final String imageLogo;
  final String age;

  ActivitesDescription(
      {this.image,
      this.deroulement,
      this.materiel,
      this.nombreJoueurs,
      this.nom,
      this.but,
      this.imageLogo,
      this.age});
  @override
  Widget build(BuildContext context) {
    //TODO ne pas oubliez de cree un boutton retour
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          ListView(
            children: [
              ClipRRect(
                child: Image(
                  height: 150,
                  width: 150,
                  image: AssetImage(imageLogo ?? 'Valeur par defaut'),
                ),
              ),
              DeroulerActivite(
                text: "NOM",
              ),
              CardActivitesDescription(
                textCardActivitesDescription: nom ?? 'Valeur par defaut',
              ),
              SizedBox(
                height: 20,
              ),
              DeroulerActivite(
                text: "NOMBRES JOUEURS",
              ),
              CardActivitesDescription(
                textCardActivitesDescription:
                    nombreJoueurs ?? 'Valeur par defaut',
              ),
              SizedBox(height: 20),
              DeroulerActivite(text: "AGE"),
              CardActivitesDescription(
                  textCardActivitesDescription: age ?? 'Valeur par defaut'),
              SizedBox(height: 20),
              DeroulerActivite(text: "MATERIEL"),
              CardActivitesDescription(
                textCardActivitesDescription: materiel ?? 'Valeur par defaut',
              ),
              SizedBox(
                height: 20,
              ),
              DeroulerActivite(text: "BUT"),
              CardActivitesDescription(
                  textCardActivitesDescription: but ?? 'Valeur par defaut'),
              SizedBox(height: 20),
              DeroulerActivite(text: "DEROULEMENT"),
              CardActivitesDescription(
                  textCardActivitesDescription:
                      deroulement ?? 'Valeur par defaut'),
            ],
          ),
        ],
      ),
    );
  }
}

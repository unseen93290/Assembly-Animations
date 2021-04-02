import 'package:flutter/material.dart';

import '../Tools/ListImageActivites.dart';
import '../Tools/Const.dart';
import '../CustomWidgets/CardActivitesDescription.dart';
import '../CustomWidgets/DeroulerActivite.dart';

class ActivitesDescription extends StatelessWidget {
  final String image;
  ActivitesDescription({this.image});
  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage("Assets/Images/Dooblelogo.png"),
                ),
              ),
              DeroulerActivite(
                text: "NOM",
              ),
              CardActivitesDescription(
                textCardActivitesDescription: "Dooble",
              ),
              SizedBox(
                height: 20,
              ),
              DeroulerActivite(
                text: "NOMBRES JOUEURS",
              ),
              CardActivitesDescription(
                textCardActivitesDescription: " 2 a 8 Joueurs",
              ),
              SizedBox(
                height: 20,
              ),
              DeroulerActivite(
                text: "BUT",
              ),
              CardActivitesDescription(
                textCardActivitesDescription:
                    "Quel que ce soit le jeu, il faut toujours etre le plus rapide a repérer le symbole identique , entre deux cartes, le nommer à haute voix , puis prendre la carte  la poser ou la defausser selon  les regles du mini-jeu auquel vous etes en train de jouer",
              ),
              SizedBox(
                height: 20,
              ),
              DeroulerActivite(
                text: "DEROULEMENT",
              ),
              CardActivitesDescription(
                  textCardActivitesDescription:
                      "Au top départ les joueurs retournent leur carte.Les joueurs doivent alors trouver le symbole identique entre leur carte et celle posée au centre de la table (sur la pile).Dès qu’un joueur trouve un symbole identiqueil le nomme,s’empare de la carte concernéeet la pose devant lui sur sa carte.En prenant cette carte, une nouvelle carte centrale est ainsi révélée.La partie continue jusqu’à ce que toutes les cartes de la pioche aient été récupérées"),
            ],
          ),
        ],
      ),
    );
  }
}

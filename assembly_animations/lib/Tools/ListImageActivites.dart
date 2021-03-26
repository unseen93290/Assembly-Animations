import 'package:flutter/material.dart';
import '../CustomWidgets/imageActivites.dart';
import '../Pages/ActivitesDescription.dart';

List<ImagesActivites> activites = [
  ImagesActivites(
      nom: "Dooble",
      nombreJoueurs: "2 a 8",
      but: "Blablabalabl",
      materiel: "zkfzofkzofkzok",
      deroulement: "ifjeifjeijfeifje",
      image: "Assets/Images/dooble.jpg",
      onTap: () {
        print("test");
        /*Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ActivitesDescription();
            }));*/
      }),
  ImagesActivites(
      nom: "love letter",
      nombreJoueurs: "2 a 8",
      but: "Blablabalabl",
      materiel: "zkfzofkzofkzok",
      deroulement: "ifjeifjeijfeifje",
      image: "Assets/Images/Loveletter.jpg",
      onTap: () {
        print("test");
        /*Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ActivitesDescription();
            }));*/
      }),
];
//return MaterialApp();

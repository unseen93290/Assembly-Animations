import 'package:flutter/material.dart';

import '../Tools/ListImageActivites.dart';
import '../CustomWidgets/imageActivites.dart';

class ListJeuxSociete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activites.length,
        itemBuilder: (context, index) {
          return ImagesActivites(
            imageLogo: activites[index].imageLogo,
            onTap: activites[index].onTap,
            image: activites[index].image,
            nom: activites[index].nom,
            nombreJoueurs: activites[index].nombreJoueurs,
            but: activites[index].but,
            materiel: activites[index].materiel,
            deroulement: activites[index].deroulement,
            age: activites[index].age,
          );
        },
      ),
    );
  }
}

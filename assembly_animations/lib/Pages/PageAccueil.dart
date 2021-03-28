import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:flutter/material.dart';
import 'package:assembly_animations/Tools/Const.dart';
import '../CustomWidgets/CategoriesJeux.dart';
import '../CustomWidgets/imageActivites.dart';
import 'package:assembly_animations/Tools/ListImageActivites.dart';

class PageAcceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffE77F20),
          Color(0xffffffff),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Color(0xffFFFFFF),
                filled: true,
                hintText: "Recherche",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50,
            height: 50,
          ),
          Expanded(
            child: Column(
              children: [
                CategoriesJeux(typeJeux: "Jeux Sociéte"),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: activites.length,
                    itemBuilder: (context, index) {
                      return ImagesActivites(
                        onTap: activites[index].onTap,
                        image: activites[index].image,
                        nom: activites[index].nom,
                        nombreJoueurs: activites[index].nombreJoueurs,
                        but: activites[index].but,
                        materiel: activites[index].materiel,
                        deroulement: activites[index].deroulement,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

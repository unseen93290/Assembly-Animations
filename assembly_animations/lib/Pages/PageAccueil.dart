import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:flutter/material.dart';
import 'package:assembly_animations/Tools/Const.dart';
import '../CustomWidgets/CategoriesJeux.dart';
import '../CustomWidgets/imageActivites.dart';
import 'package:assembly_animations/Tools/ListImageActivites.dart';
import '../CustomWidgets/ListJeuxSociete.dart';
import '../CustomWidgets/ListJeuxExterrieur.dart';

class PageAcceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 1300,
            width: 1300,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffE77F20),
                Color(0xffffffff),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(40),
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
                      ListJeuxSociete(),
                      CategoriesJeux(typeJeux: "Jeux Collectif"),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        width: 500,
                        //TODO Ne pas oublier de voir coment racourcir le listView comme en haut mais en utilisant le meme Images Activites
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: jeuxExterrieur.length,
                          itemBuilder: (context, index) {
                            return ImagesActivites(
                              imageLogo: jeuxExterrieur[index].imageLogo,
                              onTap: jeuxExterrieur[index].onTap,
                              image: jeuxExterrieur[index].image,
                              nom: jeuxExterrieur[index].nom,
                              nombreJoueurs:
                                  jeuxExterrieur[index].nombreJoueurs,
                              but: jeuxExterrieur[index].but,
                              materiel: jeuxExterrieur[index].materiel,
                              deroulement: jeuxExterrieur[index].deroulement,
                              age: jeuxExterrieur[index].age,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:flutter/material.dart';
import 'package:assembly_animations/Tools/Const.dart';
import '../CustomWidgets/CategoriesJeux.dart';
import '../CustomWidgets/imageActivites.dart';
import 'package:assembly_animations/Tools/ListImageActivites.dart';
import '../CustomWidgets/ListJeuxSociete.dart';
import '../CustomWidgets/ListJeuxExterrieur.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 1300,
              width: 1300,
              color: Color(0xffDD985C),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 20, top: 20, left: 40, right: 40),
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
      ),
    );
  }
}

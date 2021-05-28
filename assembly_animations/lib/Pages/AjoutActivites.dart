import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AjoutActivites extends StatefulWidget {
  @override
  _AjoutActivitesState createState() => _AjoutActivitesState();
}

class _AjoutActivitesState extends State<AjoutActivites> {
  PickedFile imageFile;
  final ImagePicker picker =
      ImagePicker(); // Voir utilisation sur pubdev de imagePicket

  String nom;
  String nombreJoueurs;
  String but;
  String materiel;
  String age;
  String deroulement;
  String valuechoose;

  List listJeux = [
    "Jeux Exterieur",
    "Jeux Interrieur",
    "Grand Jeux",
    "Activité Manuelle"
  ];

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          child: Form(
            key: formkey,
            child: ListView(
              //TODO Remplacer les sizedBox part un padding
              padding: EdgeInsets.all(10),
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.50),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            size: 40,
                          ),
                          onPressed: () => showModalBottomSheet(
                              //showModal permet de cree une fenetre s'ouvrant vert le bas lors de la pression de l'utilisateur
                              context: context,
                              builder: ((builder) =>
                                  bottomSheet())), // Creation Widget qui a un container de mise en forme de la fenetre vu precedement
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("  Ajouter une image"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //TODO Essayer de refactoriser ce bout de code il est trop long + ajouter des commentaire pour toute les nouvelles choses vu s
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButton(
                    iconSize: 30,
                    isExpanded: true,
                    underline: SizedBox(),
                    hint: Text("Choisissez une categorie de jeux"),
                    dropdownColor: Colors.white,
                    style: TextStyle(color: Colors.black),
                    items: listJeux.map((var valueItem) {
                      // le widget permet d'afficher un menu deroulant voila comment se presente les chose , la map recupere toute la liste et la value item represente le premier element de celle ci
                      return DropdownMenuItem<String>(
                        child: Text(valueItem),
                        value: valueItem, // Declaration de valueItem
                      );
                    }).toList(), // Obligation de convertir en list car le drop menu ne fonctionne que par liste
                    value:
                        valuechoose, // Declaration de la valeur qu'on va utiliser dans les menus
                    onChanged: (newValue) => setState(() {
                      valuechoose =
                          newValue; // Une foi que la valeur est choisit dans le menu on fait un setState pour changer la valeur de newValue en Valuechoose
                    }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      kTextFormFieldDecoration.copyWith(hintText: "Nom"),
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => nom = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kTextFormFieldDecoration.copyWith(
                      hintText: "Nombre de joueurs"),
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => nombreJoueurs = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      kTextFormFieldDecoration.copyWith(hintText: "Age"),
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => age = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      kTextFormFieldDecoration.copyWith(hintText: "Materiel"),
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => materiel = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      kTextFormFieldDecoration.copyWith(hintText: "But"),
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => but = value,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: kTextFormFieldDecoration.copyWith(
                      //contentPadding permet d'agrandir le rectangle textformfield
                      contentPadding: EdgeInsets.only(top: 90, left: 10),
                      hintText: "Deroulement"),
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) =>
                      value.isEmpty ? "Veuillez rentrer des carcteres" : null,
                  onChanged: (value) => deroulement = value,
                ),
                SizedBox(height: 20),
                RegisterButton(
                    text: "Valider",
                    onPressed: () => formkey.currentState.validate()
                        ? print("Enregistrer")
                        : "Erreur l'un des Champs n'est pas remplie"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    //take photo fait parti de image picker voir yaml permet de donc de recuperer une foto a partir de l'appareil ou de la galerie
    final pickedFile = await picker.getImage(
        source:
            source); // Ne pas oubliez de la mettre asychrone . Limage source represente la methode (ex appareil photo ou galery)
    setState(() {
      imageFile = pickedFile;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Text("Choisissez votre photo"),
          // ignore: deprecated_member_use
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    //TextButton.icon remplace le flatbutton.icon
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera, color: Colors.deepOrange),
                  label: Text(
                    "Appareil photo",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
              TextButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.image, color: Colors.deepOrange),
                  label: Text(
                    "Gallery",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

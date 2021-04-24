import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GeneraterPage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth =
      FirebaseAuth.instance; // Initialisation firebase authentification
  final formkey = GlobalKey<
      FormState>(); // formkey sert a controler si tout est ok dans le champs
  String email;
  String password;
  String error = "";
  bool isSecret = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          // Creation formulaire
          key: formkey, //Controle de la key
          child: ListView(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Hero(
                // Permet de transformer le petit icon dooble en gros sur la prochaine page
                tag: "DoobleLogo",
                child: Container(
                  height: 200,
                  child: Image.asset(
                    "Assets/Images/DoobleLogo.png",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  validator:
                      (value) => // validator controle si value est dit si il l'est alor il met le text sinon il fait rien
                          value.isEmpty ? "Veuillez entrer un email" : null,
                  decoration: kTextInputDecoration.copyWith(
                      hintText: "Entrer votre email",
                      suffixIcon: Icon(Icons.email)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: TextFormField(
                  obscureText: isSecret,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  //TODO Ne pas oubliez de factoriser le code voir video youtube surtout pour le validator
                  validator: (value) {
                    // validator controle si value est plus petit ou egal a 0 alor il met veuillez entrer votre mot de passe
                    if (value.length <= 0) {
                      print(value.length);
                      return " Veuillez entrez votre mot de passe";
                    } else if (value.length < 6) {
                      // si valeur inferieur a 6 alor votre mot de passe doit comporter...
                      print("champs nul");
                      return "Votre mot de passe doit comporter minimum 6 caracteres";
                    } else {
                      return null;
                    }
                  },
                  decoration: kTextInputDecoration.copyWith(
                    hintText: "Entrer votre mot de passe",
                    suffixIcon: InkWell(
                      // Creation d'un setState pour changer l'etat lors de la pression sur l'oeil au debut is Secret est a true du coup on ne vois pas l'oeil ensuite en tapant sur l'oeil l'etat change et isSecret devien false ce qui change l'oeil
                      onTap: () => setState(() => isSecret = !isSecret),
                      child: Icon(
                          isSecret ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RegisterButton(
                text: "Enregistrer",
                onPressed: () async {
                  if (formkey.currentState.validate()) {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GeneraterPage()));
                      }
                    } catch (e) {
                      print(e);
                      setState(() {
                        error = "Veuillez entrer un email correct";
                      });
                    }
                  }
                },
              ),
              Text(error,
                  textAlign: TextAlign.center,
                  style:
                      kTextStyleError) // on met rien si c'est bon et si c'est pas le cas alor l'eror s'affiche
            ],
          ),
        ),
      ),
    );
  }
}

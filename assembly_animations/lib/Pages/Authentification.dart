import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Pages/GeneraterPage.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  String email;
  String password;
  String error = "";
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Form(
            key: formkey,
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
                  margin: EdgeInsets.only(bottom: 17, left: 20, right: 20),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) =>
                        value.isEmpty ? "Veuillez entrer un email" : null,
                    decoration: kTextInputDecoration.copyWith(
                        hintText: "Entrer votre email"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 17, left: 20, right: 20),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      if (value.length <= 0) {
                        print(value.length);
                        return " Veuillez entrez votre mot de passe";
                      } else if (value.length < 6) {
                        print("champs nul");
                        return "Votre mot de passe doit comporter minimum 6 caracteres";
                      } else {
                        return null;
                      }
                    },
                    decoration: kTextInputDecoration.copyWith(
                        hintText: "Entrer votre mot de passe"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RegisterButton(
                  text: "Connecter",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

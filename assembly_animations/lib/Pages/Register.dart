import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GeneraterPage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? "Veuillez entrer un email" : null,
                  decoration: textInputDecoration.copyWith(
                    hintText: "Entrer votre email",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) => password.length < 6 || password == null
                      ? "Veuillez entrez un mot de passe d'au moin 6 catacteres"
                      : null,
                  decoration: textInputDecoration.copyWith(
                      hintText: "Entrer votre mot de passe"),
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
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

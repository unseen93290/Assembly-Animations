import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/CustomWidgets/SignOut.dart';
import 'package:assembly_animations/Pages/GeneraterPage.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

// Pour tout commentaire relatif au code voir register
class _AuthentificationState extends State<Authentification> {
  final _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  String email;
  String password;
  String error = "";
  bool _isSecret = true;

  void reset() {
    formkey.currentState.reset();
    error = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO Ressayer tentative plutard pour le loading
      body: SafeArea(
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: SigntOut(
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
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) =>
                      value.isEmpty ? "Veuillez entrer un email" : null,
                  decoration: kTextInputDecoration.copyWith(
                    hintText: "Entrer votre email",
                    suffixIcon: Icon(Icons.email, color: Colors.deepOrange),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 17, left: 20, right: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  obscureText: _isSecret,
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) => (value.length <= 0)
                      ? "Veuillez entrer un mot de passe"
                      : (value.length < 6)
                          ? "Veuillez entrer 6 caractere minimum"
                          : null,
                  decoration: kTextInputDecoration.copyWith(
                    hintText: "Entrer votre mot de passe",
                    suffixIcon: InkWell(
                      onTap: () => setState(() => _isSecret = !_isSecret),
                      child: Icon(
                        !_isSecret ? Icons.visibility : Icons.visibility_off,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //TODO Faire en sorte de reinitialiser les texfield au retour du menu principale + Grizer le bouton si adresse mail non valider
              RegisterButton(
                color: Colors.deepOrange,
                text: "Connecter",
                onPressed: () async {
                  if (formkey.currentState.validate()) {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);

                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    GeneraterPage()));
                      }
                      reset();
                    } catch (e) {
                      print(e);
                      setState(
                        () {
                          error = "Verifier votre email ou mot de passe";
                        },
                      );
                    }
                  }
                },
              ),

              Text(error, textAlign: TextAlign.center, style: kTextStyleError),
            ],
          ),
        ),
      ),
    );
  }
}

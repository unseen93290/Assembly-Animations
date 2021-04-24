import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
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
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");
  String email;
  String password;
  String error = "";
  bool _isSecret = true;

  @override
  /*void dispose() {
    super.dispose();
    email.text = "";
    password.dispose();
  }
*/
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
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    validator: (value) =>
                        value.isEmpty || !emailRegex.hasMatch(value)
                            ? "Veuillez entrer un email valide"
                            : null,
                    onChanged: (value) {
                      email = value;
                      print(email);
                    },
                    decoration: kTextInputDecoration.copyWith(
                        hintText: "Entrer votre email",
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.deepOrange,
                        )),
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
                    validator: (value) {
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
                  text: "Connecter",
                  onPressed: !emailRegex.hasMatch(email)
                      ? null
                      : () async {
                          if (formkey.currentState.validate()) {
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            GeneraterPage()));
                              }
                            } catch (e) {
                              print(e);
                              setState(() {
                                error = "Verifier votre email ou mot de passe";
                              });
                            }
                          }
                        },
                ),
                Text(error,
                    textAlign: TextAlign.center, style: kTextStyleError),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

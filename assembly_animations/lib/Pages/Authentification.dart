import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Pages/GeneraterPage.dart';
import 'package:assembly_animations/Tools/Const.dart';

import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: ListView(
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
                height: 50,
                margin: EdgeInsets.only(bottom: 17, left: 20, right: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: "Entrer votre email"),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: textInputDecoration.copyWith(
                      hintText: "Entrer votre mot de passe"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RegisterButton(
                text: "Connecter",
                onPressed: () {
                  print("Appuyer");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

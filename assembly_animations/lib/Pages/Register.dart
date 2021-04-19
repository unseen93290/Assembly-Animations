import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
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
                text: "Enregistrer",
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

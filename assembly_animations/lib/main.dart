import 'package:flutter/material.dart';
import 'Const.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  String jeuxSociete = "Jeux Societe";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffE77F20),
              Color(0xffffffff),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(30),
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
              Container(
                alignment: Alignment.topLeft,
                child: Text(jeuxSociete, style: kCategorieJeux),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    child: Image(
                      image: AssetImage("Assets/Images/dooble.jpg"),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

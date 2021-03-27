import 'package:flutter/material.dart';
import '../Tools/ListImageActivites.dart';

class ActivitesDescription extends StatelessWidget {
  String image = "Assets/Images/Loveletter.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
              ),
              Container(
                child: Card(
                  child: Text("Nom"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

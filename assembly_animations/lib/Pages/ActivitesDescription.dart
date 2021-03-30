import 'package:flutter/material.dart';
import '../Tools/ListImageActivites.dart';

class ActivitesDescription extends StatelessWidget {
  String image = "Assets/Images/dooble.jpg";
  ActivitesDescription({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage("Assets/Images/dooble.jpg"),
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 50,
                width: 50,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black, style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.white70,
                  child: Text("Nom"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(),
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70,
                width: double.infinity,
                child: Card(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 270,
                width: double.infinity,
                child: Card(
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

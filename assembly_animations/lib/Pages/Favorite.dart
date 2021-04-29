import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 1300,
            width: 1300,
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 30, bottom: 30),
                    height: 100,
                    width: 600,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image.asset(
                        "Assets/Images/Drapeau.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assembly_animations/CustomWidgets/RegisterButton.dart';
import 'package:assembly_animations/CustomWidgets/TextAnimation.dart';
import 'package:assembly_animations/Pages/Authentification.dart';
import 'package:assembly_animations/Pages/Register.dart';
import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  /*void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = ColorTween(begin: Colors.deepOrange, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }
*/
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "DoobleLogo",
                      child: Container(
                        child: Image.asset("Assets/Images/DoobleLogo.png"),
                        height: 70,
                      ),
                    ),
                    TextAnimation(
                      text: "Anim Head",
                      duration: Duration(milliseconds: 150),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            RegisterButton(
              text: "Enregistrez vous",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Register(),
                    ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            RegisterButton(
              text: "Connectez vous",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Authentification(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffE77F20),
                Color(0xffffffff),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Card(
                      margin: EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Container(
                        height: 100,
                        child: Opacity(
                          opacity: 0.4,
                          child: Image(
                            fit: BoxFit.cover,
                            width: double.infinity,
                            image: AssetImage("Assets/Images/dooble.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

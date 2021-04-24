import 'package:assembly_animations/Pages/Authentification.dart';
import 'package:assembly_animations/Pages/PageAccueil.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/Home.dart';
import 'Pages/GeneraterPage.dart';

void main() async {
  // Initialisation a la base du main pour firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(cardColor: Colors.white70),
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

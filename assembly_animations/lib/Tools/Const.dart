import 'package:assembly_animations/Pages/ActivitesDescription.dart';
import 'package:assembly_animations/Pages/Authentification.dart';
import 'package:flutter/material.dart';

// Page d'accueil
var kCouleurFondEcran = Color(0xffE77F20);
var kEcritureRecherche = TextStyle(
  color: Colors.grey,
  fontSize: 50,
);

var kCategorieJeux =
    TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold);

// ActivitesDescription
var kStyleEcriture = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

// Authentification

const textInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
);

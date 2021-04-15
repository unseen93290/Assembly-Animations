import 'package:assembly_animations/Pages/GeneraterPage.dart';
import 'package:assembly_animations/Tools/Const.dart';
import 'package:assembly_animations/Tools/Loading.dart';
import 'package:flutter/material.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  bool showSignIn = true;
  String error = "";
  bool loading = false;
  final formKey = GlobalKey<FormState>(); //
  final userController =
      TextEditingController(); // Controle si le texte est bon , si le champ n'est pas vide ect ...
  final motDePasseController = TextEditingController();
  @override
  void dispose() {
    // Le dispose permet de vider le cache memoire pour initialiser les controleur
    userController.dispose();
    motDePasseController.dispose();
    super.dispose();
  }

  void accesSwitch() {
    setState(() {
      userController.text = "";
      motDePasseController.text = "";
      showSignIn = !showSignIn;
    });
  }

  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: 1300,
                      width: 1300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffE77F20),
                              Color(0xffffffff),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Center(
                        child: Form(
                          key: formKey,
                          child: ListView(
                            children: [
                              Container(
                                child: TextButton.icon(
                                  onPressed: () {
                                    accesSwitch();
                                  },
                                  label: Text(
                                    showSignIn
                                        ? "Inscrivez vous "
                                        : "Connectez vous ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ClipRRect(
                                child: Image(
                                  height: 200,
                                  width: 200,
                                  image: AssetImage(
                                    "Assets/Images/dooble.jpg",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: "Email/Pseudo"),
                                  controller: userController,
                                  validator: (value) {
                                    print(value);
                                    if (value == value.isEmpty) {
                                      // Si la valeur est vide alor message d'erreur

                                      return "Entrer votre email ou pseudo";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    obscureText: true,
                                    decoration: textInputDecoration.copyWith(
                                        hintText: "Mot de passe"),
                                    controller: motDePasseController,
                                    validator: (value) => value.length < 6
                                        ? "Veuillez rentrer 6 caracteres minimum"
                                        : null),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Center(
                                // ignore: deprecated_member_use
                                child: FlatButton(
                                  disabledColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.white,
                                  onPressed: () {
                                    print("Appuyer");
                                    Navigator.push(context,
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) {
                                      return GeneraterPage();
                                    }));
                                  },
                                  child: Text(showSignIn
                                      ? "Conectez vous "
                                      : "Enregistrez vous"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
  }
}

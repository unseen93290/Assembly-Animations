import 'package:flutter/material.dart';
import '../Tools/ListContact.dart';
import '../CustomWidgets/Contact.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO Construire la page message voir le cour d'angela
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: contact.length,
          itemBuilder: (context, index) {
            return Contact(
              image: contact[index].image,
              name: contact[index].name,
              lastMessage: contact[index].lastMessage,
            );
          },
        ),
      ),
    );
  }
}

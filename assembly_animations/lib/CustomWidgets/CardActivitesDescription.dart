import 'package:flutter/material.dart';
import '../Tools/Const.dart';

class CardActivitesDescription extends StatelessWidget {
  final String textCardActivitesDescription;

  CardActivitesDescription({this.textCardActivitesDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),

      // BoxConstraints permet d'ajuster le container a son enfant il y aura donc un un "cadre" standart il se redimensionne automtiquement au text qu'il contien
      constraints: BoxConstraints(
          maxWidth: double.infinity,
          minHeight: 70,
          minWidth: 100,
          maxHeight: double.infinity),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        color: Colors.white70,
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: Text(textCardActivitesDescription ?? 'valeur par défaut',
              style: kStyleEcriture),
        ),
      ),
    );
  }
}

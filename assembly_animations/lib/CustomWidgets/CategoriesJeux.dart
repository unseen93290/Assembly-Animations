import 'package:flutter/material.dart';
import '../Tools/Const.dart';

class CategoriesJeux extends StatelessWidget {
  final String typeJeux;
  CategoriesJeux({this.typeJeux});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10),
      child: Text(typeJeux, style: kCategorieJeux),
    );
  }
}

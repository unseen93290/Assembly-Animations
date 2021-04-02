import 'package:flutter/material.dart';

class DeroulerActivite extends StatelessWidget {
  final String text;
  DeroulerActivite({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 22),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.black54, fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}

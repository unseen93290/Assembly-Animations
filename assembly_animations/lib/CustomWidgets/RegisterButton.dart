import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  String text;
  Function onPressed;
  RegisterButton({this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        height: 50,
        color: Colors.deepOrange,
      ),
    );
  }
}

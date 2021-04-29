import 'package:flutter/material.dart';

class SigntOut extends StatelessWidget {
  Function onPressed;

  SigntOut({
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.exit_to_app,
        color: Colors.black,
        size: 30,
      ),
      onPressed: onPressed,
    );
  }
}

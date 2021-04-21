import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  String text;
  var duration;

  TextAnimation({@required this.text, this.duration});

  @override
  Widget build(BuildContext context) {
    return TypewriterAnimatedTextKit(
      speed: duration,
      text: [text],
      textStyle: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}

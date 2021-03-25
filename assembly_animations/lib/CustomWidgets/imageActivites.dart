import 'package:flutter/material.dart';

class ImagesActivites extends StatelessWidget {
  String image;
  ImagesActivites({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.topLeft,
      width: 200,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(image),
        ),
      ),
    );
  }
}

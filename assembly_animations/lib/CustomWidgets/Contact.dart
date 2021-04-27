import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  String image;
  String lastMessage;
  String name;

  Contact({this.image, this.name, this.lastMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: Container(
            height: 70,
            width: 70,
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: AssetImage(image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Stack(children: [
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    lastMessage,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Divider(
                  color: Colors.green,
                  height: 10,
                  thickness: 20,
                  indent: 20,
                  endIndent: 70,
                ),
              ],
            ),
          ]),
        )
      ]),
    );
  }
}

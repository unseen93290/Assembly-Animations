import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFavorite extends StatefulWidget {
  String image;
  bool favorite = true;
  String nom;
  CardFavorite({this.image, this.favorite, this.nom});

  @override
  _CardFavoriteState createState() => _CardFavoriteState();
}

class _CardFavoriteState extends State<CardFavorite> {
  bool favorite = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          // IMPORTANTT !!!!! Si jamais tu veux cree une card ou une image et que l'arondissement des coter ce fais mais que le container reste rectangle voila comment faire
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.image,
                  ),
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 50,
          child: IconButton(
            iconSize: 40,
            color: Colors.black,
            icon: favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () {
              setState(() {
                //TODO Demander a mohamed pourquoi quand je met savorite dans la premiere parti du stateful et que j'utilise widget.favorite je me retrouve avec un nul alor que sa fonctionne pour l'image
                if (favorite == true) {
                  favorite = false;
                } else {
                  favorite = true;
                }
              });
            },
          ),
        ),
        Positioned(
          child: Text(
            widget.nom,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

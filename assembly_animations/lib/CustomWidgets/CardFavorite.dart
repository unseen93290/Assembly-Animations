import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardFavorite extends StatefulWidget {
  String image;

  String nom;
  CardFavorite({this.image, this.nom});
  @override
  _CardFavoriteState createState() => _CardFavoriteState();
}

class _CardFavoriteState extends State<CardFavorite> {
  bool favorite = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // IMPORTANTT !!!!! Si jamais tu veux cree une card ou une image et que l'arondissement des coter ce fais mais que le container reste rectangle voila comment faire
          Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.image,
                  ),
                ),
                borderRadius: BorderRadius.circular(20)),
          ),

          Positioned(
            child: IconButton(
              iconSize: 40,
              color: Colors.black,
              icon:
                  favorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
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
              right: 1,
              top: 60,
              child: IconButton(
                icon: Icon(
                  Icons.bar_chart,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  //TODO Ne pas oublier de retirer le print
                  print("Appuyer");
                },
              )),
        ],
      ),
    );
  }
}

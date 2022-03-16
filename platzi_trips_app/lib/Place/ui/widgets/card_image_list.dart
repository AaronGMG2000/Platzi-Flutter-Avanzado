import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 325,
      child: ListView(
        padding: const EdgeInsets.all(25),
        scrollDirection: Axis.horizontal,
        children:const <Widget>[
          CardImage("assets/images/fondo.jpg"),
          CardImage("assets/images/fondo2.jpg"),
          CardImage("assets/images/fondo3.jpg"),
          CardImage("assets/images/fondo4.jpg"),
        ],
      ),
    );
  }
}
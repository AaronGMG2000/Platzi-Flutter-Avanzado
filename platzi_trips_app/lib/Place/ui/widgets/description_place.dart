import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';

class DescriptionPlace extends StatelessWidget {
  final String namePlace;
  final int stars;
  final String descriptionPlace;
  const DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final description = Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Text(
          descriptionPlace,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontFamily: "Lato"),
        ));

    final star = Container(
      margin: const EdgeInsets.only(
        top: 323.0,
        right: 3.0,
      ),
      child: const Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    );

    final tittleStars = Row(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Text(
            namePlace,
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Lato"),
            textAlign: TextAlign.left,
          )),
      Row(children: <Widget>[star, star, star, star, star]),
    ]);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          tittleStars,
          description,
          const ButtonPurple("Navigate")
        ]);
  }
}

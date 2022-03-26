import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class ImageProfile extends StatelessWidget {
  final String url;
  final String name;
  final String description;
  final String calification;
  final VoidCallback onPressedFav;
  const ImageProfile({
    Key? key,
    required this.url,
    required this.name,
    required this.description,
    required this.calification,
    required this.onPressedFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Container(
      height: 250,
      width: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: url.contains('assets')
              ? AssetImage(url)
              : url == ''
                  ? const AssetImage("assets/images/noImage.jpg")
                  : NetworkImage(url) as ImageProvider,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );

    final namePublication = Text(
      name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.left,
    );

    final descriptionPublication = Container(
        height: 60,
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Text(
              description,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  fontFamily: 'Lato',
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));

    final calificationPublication = Container(
        margin: const EdgeInsets.only(top: 100),
        child: Text(
          "Likes: $calification",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent[700]),
          textAlign: TextAlign.left,
        ));

    final publication = Container(
      height: 150,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          namePublication,
          descriptionPublication,
          calificationPublication
        ],
      ),
    );

    final publicationContainer = SizedBox(
      height: 180,
      width: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: publication,
            top: 0,
            left: 0,
            right: 0,
          ),
          Positioned(
            child: FloatingActionButtonGreen(
              iconData: Icons.favorite_border,
              onPressed: onPressedFav,
            ),
            right: 10,
          )
        ],
        alignment: Alignment.bottomRight,
      ),
    );

    return Container(
      height: 350,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          image,
          Positioned(
            child: publicationContainer,
            top: 150,
          )
        ],
        alignment: Alignment.topCenter,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/floating_action_button_green.dart';

class ImageProfile extends StatelessWidget {
  final String url;
  final String name;
  final String description;
  final String calification;
  const ImageProfile(this.url, this.name, this.description, this.calification,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Container(
      height: 250,
      width: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(url),
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

    final descriptionPublication = Text(
      description,
      style: const TextStyle(fontSize: 14, color: Colors.black54),
      textAlign: TextAlign.left,
    );

    final calificationPublication = Text(
      "Calificación: $calification",
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.greenAccent[700]),
      textAlign: TextAlign.left,
    );

    final publication = Container(
      height: 115,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          namePublication,
          descriptionPublication,
          calificationPublication
          
        ],
      ),
    );

    final publicationContainer = SizedBox(
      height: 140,
      width: 300,
      child: Stack(
        children: <Widget>[
          Positioned(
            child: publication,
            top: 0,
            left: 0,
            right: 0,
          ),
          const Positioned(
            child: FloatingActionButtonGreen(),
            right: 10,
          )
        ],
        alignment: Alignment.bottomRight,
      ),
    );

    return Container(
      height: 340,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          image,
          Positioned(
            child: publicationContainer,
            top: 175,
          )
        ],
        alignment: Alignment.topCenter,
      ),
    );
  }
}

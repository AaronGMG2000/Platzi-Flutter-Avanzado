import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/ui/widgets/image_profile.dart';

class ProfileImagesList extends StatelessWidget {
  const ProfileImagesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 280.0),
      child: ListView(
        children: const <Widget>[
          ImageProfile(
              'assets/images/fondo.jpg',
              "Halo: Reach",
              "Es el sexto videojuego de la saga Halo, así como su tercer videojuego Publicado",
              "92"),
          ImageProfile(
              'assets/images/fondo3.jpg',
              "Halo: Guardians",
              "salió el 27 de octubre de 2015 desarrollado por 343 Industries",
              "85"),
          ImageProfile(
              'assets/images/fondo4.jpg',
              "Halo: Infinite",
              "Catalogado por 343 Industries como un reinicio espiritual para la saga Halo",
              "90"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
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
    UserBloc userBloc = BlocProvider.of(context);

    return StreamBuilder(
        stream: userBloc.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Place place = snapshot.data;
            return datos(place);
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 400.0, left: 20.0, right: 20.0),
                  child: const Text(
                    "Selecciona un lugar",
                    style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            );
          }
        });
  }

  Widget datos(Place place) {
    final description = Container(
        margin: const EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Text(
          place.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontFamily: "Lato"),
        ));

    final tittleStars = Row(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(
              top: 320.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Text(
              place.name,
              style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato"),
              textAlign: TextAlign.left,
            )),
        Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 323.0,
                right: 3.0,
              ),
              child: Text(
                "Likes: ${place.likes.toString()}",
                style: const TextStyle(
                    fontFamily: "Lato",
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.amber),
              ),
            ),
          ],
        ),
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tittleStars,
        description,
        ButtonPurple(
          buttonText: "Navigate",
          onPressed: () {},
        )
      ],
    );
  }
}

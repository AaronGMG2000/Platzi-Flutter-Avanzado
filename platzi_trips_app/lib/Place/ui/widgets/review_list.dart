import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Review("Rudy Marroquín","assets/images/unnamed.jpg","1 review 5 photos","comentario del usuario"),
        Review("Fernando Vásquez","assets/images/FER.jpg","4 review 15 photos","comentario del usuario"),
        Review("Welmann Paniagua","assets/images/WELMANN.jpg","2 review 4 photos","comentario del usuario"),
        Review("Romeo Marroquín","assets/images/ROMEO.jpg","5 review 25 photos","comentario del usuario"),
      ],
    );
  }

}

import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;
  const GradientBack(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(1.0, 0.6),
          stops: [0.0, 0.6],
          tileMode: TileMode.clamp,
          colors: [
            Color(0xFFF58524),
            Color(0xFFF92B7F),
          ],
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
        ),
      ),
      alignment: const Alignment(-0.9, -0.6),
    );
  }
}
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  final String title;
  final double height;
  const GradientBack({this.title = "", this.height = 0.0, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          height: (height == 0.0) ? screenHeight : height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp,
              colors: [
                Color.fromARGB(255, 88, 118, 218),
                Color.fromARGB(255, 80, 100, 190),
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
        ),
        Positioned(
          top: -55,
          left: 100,
          child: Container(
            width: screenHeight * 1.1,
            height: screenHeight * 1.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenHeight / 2),
              color: const Color.fromRGBO(0, 0, 0, 0.05),
            ),
          ),
        ),
      ],
    );
  }
}

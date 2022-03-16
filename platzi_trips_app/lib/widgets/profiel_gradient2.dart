
import 'package:flutter/material.dart';

class ProfielGradient2 extends StatelessWidget {
  final double size;
  const ProfielGradient2(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      decoration:  const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.elliptical(1000, 1000),
        ),
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color>[
            Color.fromARGB(255, 88, 118, 218),
            Color.fromARGB(255, 80, 90, 190),
          ],
        ),
      ),
    );
  }
}

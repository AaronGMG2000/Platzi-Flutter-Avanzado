import 'package:flutter/material.dart';

class ProfileGradient extends StatelessWidget {
  final double size;
  const ProfileGradient(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: <Color>[
            Color.fromARGB(255, 88, 118, 218),
            Color.fromARGB(255, 80, 100, 190),
          ],
        ),
      ),
      alignment: const Alignment(-1, -0.6),
    );
  }
}

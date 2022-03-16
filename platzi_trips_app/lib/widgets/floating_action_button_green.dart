import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  const FloatingActionButtonGreen({Key? key}) : super(key: key);

  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool pressed = false;

  void onPressedFav() {
    setState(() {
      pressed = !pressed;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
          pressed ? "Agregaste a tus Favoritos" : "Quitaste de tus favoritos"),
      duration: const Duration(milliseconds: 500),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff11DA53),
      mini: true,
      tooltip: 'Fav',
      child: Icon(pressed ? Icons.favorite : Icons.favorite_border),
      onPressed: onPressedFav,
    );
  }
}

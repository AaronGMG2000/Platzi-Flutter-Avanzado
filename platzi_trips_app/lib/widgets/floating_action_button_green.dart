import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  const FloatingActionButtonGreen({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);
  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xff11DA53),
      mini: true,
      tooltip: 'Fav',
      child: Icon(widget.iconData),
      onPressed: widget.onPressed,
      heroTag: null,
    );
  }
}

import 'package:flutter/material.dart';

class ButtonGreem extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final double radius;
  final VoidCallback onPressed;

  const ButtonGreem({
    required this.text,
    required this.onPressed,
    this.width = 0.0,
    this.height = 0.0,
    this.radius = 3.0,
    Key? key,
  }) : super(key: key);

  @override
  _ButtonGreemState createState() => _ButtonGreemState();
}

class _ButtonGreemState extends State<ButtonGreem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onPressed,
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFa7ff84),
                Color(0xFF1cbb78),
              ],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final double size;
  final double iconSize;
  final VoidCallback onPressed;
  final IconData iconData;
  final Color colorData;
  final Color backColor;
  final Color shadowColor;
  const CircleButton({
    required this.onPressed,
    required this.size,
    required this.iconSize,
    required this.iconData,
    this.colorData = Colors.blueAccent,
    this.backColor = Colors.white,
    this.shadowColor = Colors.black54,
    Key? key,
  }) : super(key: key);

  @override
  _CircleButtonState createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.backColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: widget.shadowColor,
              blurRadius: 2,
              spreadRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            widget.iconData,
            color: widget.colorData,
            size: widget.iconSize,
          ),
        ),
      ),
    );
  }
}

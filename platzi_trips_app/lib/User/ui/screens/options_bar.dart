import 'package:flutter/material.dart';

class OptionsBar extends StatelessWidget {
  const OptionsBar({Key? key}) : super(key: key);

  Widget getIcon(IconData iconD, String texto, double size, Color backColor,
      BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backColor,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(iconD),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(texto),
                duration: const Duration(milliseconds: 500),
              ));
            },
            color: Colors.blueAccent,
            iconSize: size * 0.6,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getIcon(Icons.bookmark_border, "Guardado", 40, Colors.white, context),
          getIcon(Icons.calendar_month, "Calendario", 40, Colors.white70, context),
          getIcon(Icons.add, "Perfil", 60, Colors.white, context),
          getIcon(Icons.email_outlined, "Email", 40, Colors.white70, context),
          getIcon(Icons.person, "Perfil", 40, Colors.white70, context),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TitleInputLocation extends StatelessWidget {
  final String hinText;
  final TextEditingController controller;
  final IconData iconData;
  const TitleInputLocation({
    Key? key,
    required this.hinText,
    required this.controller,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Lato',
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hinText,
          suffixIcon: Icon(iconData),
          fillColor: Colors.white,
          filled: true,
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
        ),
      ),
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15,
            offset: Offset(0, 7),
          ),
        ],
      ),
    );
  }
}

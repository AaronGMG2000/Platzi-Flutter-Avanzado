import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String title;
  const GradientText(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Configuración"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ));
  }
}
